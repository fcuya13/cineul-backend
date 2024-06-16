require 'sinatra'

get '/usuarios' do
  content_type :json
  DB.fetch("SELECT * FROM usuario").all.to_json
end

# Ruta para obtener un usuario por ID
get '/usuarios/:id' do
  content_type :json

  user_id = params[:id].to_i

  query = <<-SQL
    SELECT 
      (nombre || ' ' || apellido) AS "nombre completo", 
      dni, 
      foto_perfil 
    FROM 
      usuario
    WHERE
      id = ?
  SQL

  usuario = DB.fetch(query, user_id).first

  if usuario
    usuario.to_json
  else
    halt 404, { error: 'Usuario no encontrado' }.to_json
  end
end