require 'sinatra'

get '/usuarios' do
  Usuario.all.to_a.to_json
end

# Ruta para obtener un usuario por ID
get '/usuarios/:id' do
    content_type :json
  
    begin
      usuario = Usuario[params[:id]]
      halt 404, { error: 'Usuario no encontrado' }.to_json unless usuario
  
      usuario.to_json
    rescue StandardError => e
      halt 500, { error: 'Error interno del servidor', mensaje: e.message }.to_json
    end
  end