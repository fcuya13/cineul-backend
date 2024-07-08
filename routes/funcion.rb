require 'sinatra'
require 'sequel'
require 'json'

# Ruta para obtener funciones filtradas por ID de película
get '/funciones' do
  content_type :json, charset: 'utf-8'
  
  pelicula_id = params[:pelicula_id].to_i
  
  query = <<-SQL
    SELECT
      f.id AS funcion_id,
      f.pelicula_id,
      f.sala_id,
      f.fecha_hora,
      p.titulo AS pelicula_titulo,
      s.nombre AS sala_nombre,
      s.direccion AS sala_direccion
    FROM
      funciones f
    LEFT JOIN peliculas p ON f.pelicula_id = p.id
    LEFT JOIN salas s ON f.sala_id = s.id
    WHERE
      f.pelicula_id = ?
  SQL

  funciones = DB.fetch(query, pelicula_id).all
  
  funciones.to_json
end