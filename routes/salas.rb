require 'sinatra'
require 'json'

# Ruta para obtener las salas y las funciones correspondientes
get '/salas' do
  content_type 'application/json; charset=utf-8'

  if params[:id]
    sala = Sala[params[:id]]

    if sala
      funciones = Funcion.where(sala_id: sala.id).map do |funcion|
        {
          id: funcion.id,
          nombre_pelicula: funcion.pelicula.titulo,
          time: funcion.fecha_hora,
          imagen_url: funcion.pelicula.imagen_url,
        }
      end

      {
        id: sala.id,
        nombre_sala: sala.nombre,
        direccion: sala.direccion,
        imagen_url: sala.imagen_url,
        funciones: funciones  
      }.to_json
    else
      status 404
      { message: "Movie with ID #{params[:id]} not found" }.to_json
    end
  else
    sala = Sala.all

    sala.to_json(encoding: 'utf-8')
  end
end

# Ruta para buscar salas por nombre
get '/salas_search' do
  content_type 'application/json; charset=utf-8'
  nombre = params['nombre']
  if nombre
    results = Sala.where(Sequel.ilike(:nombre, "%#{nombre}%")).all
  else
    results = Sala.all #SELECT * FROM salas
  end
  results.to_json(encoding: 'utf-8')
end
