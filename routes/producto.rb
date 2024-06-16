require 'sinatra'

# Ruta para obtener todos los productos
get '/productos' do
    content_type :json
  
    query = <<-SQL
      SELECT
        *
      FROM
        productos
    SQL
  
    productos = DB.fetch(query).all
  
    productos.to_json
  end