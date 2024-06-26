require 'sinatra'

get '/home' do 
    peliculas = Pelicula.all.take(4).map do |pelicula|
        {
          id: pelicula.id,
          titulo: pelicula.titulo,
          imagen_url: pelicula.imagen_url,
          generos: pelicula.genero.map(&:nombre)
        }
      end

    peliculas.to_json
end 