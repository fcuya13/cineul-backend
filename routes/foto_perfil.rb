require'sinatra'
 
set :public_folder, 'public'

post '/usuarios/:id/foto_perfil' do
  content_type :json

  begin
    usuario = Usuario[params[:id]]
    halt 404, { error: 'Usuario no encontrado' }.to_json unless usuario

    if params[:foto_perfil] && params[:foto_perfil][:tempfile]
      filename = params[:foto_perfil][:filename]
      file = params[:foto_perfil][:tempfile]
      file_extension = File.extname(filename)
      new_filename = "usuario_#{usuario.id}#{file_extension}"
      file_path = File.join(settings.public_folder, 'profile_photos', new_filename)

      # Crear la carpeta si no existe
      FileUtils.mkdir_p(File.dirname(file_path))

      # Eliminar el archivo existente si hay uno
      if File.exist?(file_path)
        File.delete(file_path)
      end

      # Guardar el nuevo archivo
      File.open(file_path, 'wb') do |f|
        f.write(file.read)
      end

      # Actualizar la foto de perfil del usuario
      usuario.update(foto_perfil: "/profile_photos/#{new_filename}")

      { mensaje: 'Foto de perfil actualizada exitosamente', usuario: usuario }.to_json
    else
      halt 400, { error: 'No se ha proporcionado ninguna foto de perfil' }.to_json
    end
  rescue StandardError => e
    halt 500, { error: 'Error interno del servidor', mensaje: e.message }.to_json
  end
end