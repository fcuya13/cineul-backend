post '/user/validate' do
  status = 500
  resp = {
    :message => '',
    :data => '',
  }
  dni = params[:dni]
  password = params[:password]

  begin
    record = Usuario.where(dni: dni).select(:id, :password).first
    message = 'Usuario no encontrado'

    if record then
      if record[:password] == password then
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
    :message => '',
    :data => ''
  }

  nombre = params[:nombre]
  apellido = params[:apellido]
  dni = params[:dni]
  correo = params[:correo]
  password = params[:password]

  begin
    existing_user = Usuario.where(dni:dni).first
    if existing_user then
      status = 400
      resp[:message] = 'Usuario ya existente'
    else
      Usuario.insert(nombre:nombre, apellido:apellido, dni:dni, correo:correo, password:password, foto_perfil:'')
      status = 200
      resp[:message] = 'Usuario creado exitosamente'
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

post '/user/reset' do
  status = 500
  resp = {
    :message => '',
    :data => ''
  }

  dni = params[:dni]
  correo = params[:correo]

  begin
    record = Usuario.where(dni:dni, correo:correo).first
    if record then
      chars = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
      new_password = (0...15).map { chars[rand(chars.length)] }.join

      record.update(password: new_password)
      resp[:message] = "Contraseña actualizada: #{new_password}"
      status = 200
    else
      resp[:message] = 'Usuario no encontrado'
    end

  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  rescue StandardError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  end

  status status
  resp.to_json
end