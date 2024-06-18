require 'sinatra'

# Ruta para obtener todas las funciones
get '/funciones' do
    content_type :json
  
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
    SQL
  
    funciones = DB.fetch(query).all
  
    funciones.to_json
  end