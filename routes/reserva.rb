require 'sinatra'

# Ruta para crear una nueva reserva
post '/reservas' do
  content_type :json

  request_body = JSON.parse(request.body.read)
  user_id = request_body['user_id']
  funcion_id = request_body['funcion_id']
  asientos_seleccionados = request_body['asientos'] || []
  productos_seleccionados = request_body['productos'] || []

  # Verificar que la función existe
  funcion = DB[:funciones].where(id: funcion_id).first
  halt 404, { error: 'Función no encontrada' }.to_json unless funcion

  # Verificar disponibilidad de asientos
  asientos_disponibles = DB[:funcion_asiento].where(funcionid: funcion_id).exclude(id: DB[:entrada].select(:asientofuncionid).where(funcionid: funcion_id)).select_map(:id)
  asientos_no_disponibles = asientos_seleccionados - asientos_disponibles
  halt 400, { error: 'Asientos no disponibles', asientos_no_disponibles: asientos_no_disponibles }.to_json unless asientos_no_disponibles.empty?

  # Crear la reserva
  reserva_id = DB[:reserva].insert(userid: user_id)

  # Insertar los asientos seleccionados
  asientos_seleccionados.each do |asiento_id|
    DB[:entrada].insert(idreserva: reserva_id, asientofuncionid: asiento_id)
  end

  # Insertar los productos seleccionados
  productos_seleccionados.each do |producto|
    DB[:compra_productos].insert(reserva_id: reserva_id, producto_id: producto['id'], cantidad: producto['cantidad'])
  end

  { message: 'Reserva creada exitosamente' }.to_json
end