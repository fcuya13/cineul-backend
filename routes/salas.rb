require 'sinatra'


# Configuración del middleware de JSON
before do
  content_type :json
end

# Ruta para obtener todas las salas usando una consulta SQL directa
get '/salas' do
  nombre = params['nombre']
  if nombre
    results = Sala.where(Sequel.ilike(:nombre, "%#{nombre}%")).all
  else
    results = Sala.all #SELECT * FROM salas
  end
  results.to_json
end
