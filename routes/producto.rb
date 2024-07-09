require 'sinatra'
require 'json'

# Ruta para obtener todos los productos
get '/productos' do
  content_type :json, charset: 'utf-8'
  
  query = <<-SQL
    SELECT
      *
    FROM
      productos
  SQL
  
  productos = DB.fetch(query).all
  
  productos.to_json.force_encoding('UTF-8')
end
