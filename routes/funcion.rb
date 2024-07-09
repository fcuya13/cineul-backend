require 'sinatra'
require 'sequel'
require 'json'

# Ruta para obtener funciones filtradas por ID de película o ID de sala
get '/funciones' do
  content_type :json, charset: 'utf-8'
  
  pelicula_id = params[:pelicula_id].to_i
  sala_id = params[:sala_id].to_i
  
  query = <<-SQL
    SELECT
      f.id AS funcion_id,
      f.pelicula_id,
      f.sala_id,
      f.fecha_hora,
      p.titulo AS pelicula_titulo,
      s.nombre AS sala_nombre,
      s.direccion AS sala_direccion,
      s.imagen_url AS sala_imagen_url  -- Aquí añadimos la imagen_url de la sala
    FROM
      funciones f
    LEFT JOIN peliculas p ON f.pelicula_id = p.id
    LEFT JOIN salas s ON f.sala_id = s.id
  SQL

  conditions = []
  if pelicula_id > 0
    conditions << "f.pelicula_id = #{pelicula_id}"
  end

  if sala_id > 0
    conditions << "f.sala_id = #{sala_id}"
  end

  if conditions.any?
    query += " WHERE " + conditions.join(" AND ")
  end

  funciones = DB.fetch(query).all
  
  funciones.to_json
end
