# routes/user_routes.rb
require 'json'

post '/user/validate' do
  status = 500
  resp = {
    :message => '',
    :data => ''
  }
  dni = params[:dni]
  password = params[:password]

  begin
    puts "Buscando usuario con DNI: #{dni}"

    record = Usuario.where(dni: dni).select(:id, :password).first
    puts "Usuario encontrado en la base de datos: #{record.inspect}"

    if record
      if record[:password] == password
        resp[:message] = 'Usuario encontrado - Ingreso Exitoso'
        resp[:data] = record[:id]
        status = 200
      else
        resp[:message] = 'Contraseña incorrecta'
        status = 404
      end
    else
      status = 404
      resp[:message] = 'Usuario no encontrado'
    end

  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la db'
    resp[:data] = e.message

  rescue StandardError => e
    resp[:message] = 'Ocurrió un error'
    resp[:data] = e.message
  end

  status status
  resp.to_json
end

post '/user/create' do
  status = 500
  resp = {
    message: '',
    data: ''
  }

  # Parsear el cuerpo JSON de la solicitud
  begin
    request_payload = JSON.parse(request.body.read)
  rescue JSON::ParserError => e
    halt 400, { message: 'Cuerpo JSON inválido' }.to_json
  end

  nombre = request_payload['nombre']
  apellido = request_payload['apellido']
  dni = request_payload['dni']
  correo = request_payload['correo']
  password = request_payload['password']
  foto_perfil = request_payload['foto_perfil'] || ''  # Considera el caso de que foto_perfil pueda ser nulo

  # Registrar los parámetros recibidos para depuración
  puts "Parámetros recibidos: nombre=#{nombre}, apellido=#{apellido}, dni=#{dni}, correo=#{correo}, password=#{password}, foto_perfil=#{foto_perfil}"

  if nombre.nil? || apellido.nil? || dni.nil? || correo.nil? || password.nil?
    status = 400
    resp[:message] = 'Faltan parámetros requeridos'
  else
    begin
      existing_user = Usuario.where(dni: dni).first
      if existing_user
        status = 400
        resp[:message] = 'Usuario ya existente'
      else
        Usuario.insert(nombre: nombre, apellido: apellido, dni: dni, correo: correo, password: password, foto_perfil: foto_perfil)
        status = 200
        resp[:message] = 'Usuario creado exitosamente'
      end
    rescue Sequel::DatabaseError => e
      resp[:message] = 'Error al acceder a la base de datos'
      resp[:data] = e.message
    rescue StandardError => e
      resp[:message] = 'Ocurrió un error'
      resp[:data] = e.message
    end
  end

  status status
  resp.to_json
end

post '/user/reset' do
  status = 500
  resp = {
    message: '',
    data: ''
  }

  begin
    # Parsear el cuerpo JSON de la solicitud
    request_payload = JSON.parse(request.body.read)
    
    # Extraer los parámetros necesarios
    dni = request_payload['dni']
    correo = request_payload['correo']
    
    # Validar que los parámetros requeridos estén presentes
    if dni.nil? || correo.nil?
      status = 400
      resp[:message] = 'Faltan parámetros requeridos (dni y correo)'
    else
      # Intentar encontrar al usuario por dni y correo
      record = Usuario.where(dni: dni, correo: correo).first

      if record
        # Generar una nueva contraseña aleatoria
        chars = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
        new_password = (0...15).map { chars[rand(chars.length)] }.join
        
        # Actualizar la contraseña del usuario
        record.update(password: new_password)

        resp[:message] = "Contraseña actualizada: #{new_password}"
        status = 200
      else
        resp[:message] = 'Usuario no encontrado'
        status = 404
      end
    end

  rescue JSON::ParserError => e
    status = 400
    resp[:message] = 'Cuerpo JSON inválido'
  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  rescue StandardError => e
    resp[:message] = 'Ocurrió un error'
    resp[:data] = e.message
  end

  status status
  resp.to_json
end





