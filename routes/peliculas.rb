require 'sinatra'

#TODO si recibo query param que retorne todo
get '/peliculas' do
  content_type :json
  peliculas = nil

  """find
  peliculas = Pelicula.all.map do |pelicula|
    {
      id: pelicula.id,
      titulo: pelicula.titulo,
      sinopsis: pelicula.sinopsis,
      imagen_url: pelicula.imagen_url,
      trailer_url: pelicula.trailer_url,
      actores: pelicula.actor.map(&:nombre),
      generos: pelicula.genero.map(&:nombre)
    }
  end
  """
  peliculas = Pelicula.all.map do |pelicula|
    {
      id: pelicula.id,
      imagen_url: pelicula.imagen_url
    }
  end
  
  peliculas.to_json
end

