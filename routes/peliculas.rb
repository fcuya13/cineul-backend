require 'sinatra'
# Define your backend models

# Route to get movie information by ID or all movies
get '/peliculas' do
  content_type :json

  # Check if a specific movie ID is provided as a query parameter
  if params[:id]
    pelicula = Pelicula[params[:id]]

    # If the movie with the given ID exists, return its detailed information
    if pelicula
      # Fetch associated functions for the movie
      funciones = Funcion.where(pelicula_id: pelicula.id).map do |funcion|
        {
          id: funcion.id,
          time: funcion.fecha_hora,
          # Add other relevant function details here
        }
      end

      {
        id: pelicula.id,
        titulo: pelicula.titulo,
        sinopsis: pelicula.sinopsis,
        imagen_url: pelicula.imagen_url,
        trailer_url: pelicula.trailer_url,
        actores: pelicula.actor.map(&:nombre),
        generos: pelicula.genero.map(&:nombre),
        funciones: funciones  # Include associated functions in the response
      }.to_json
    else
      status 404
      { message: "Movie with ID #{params[:id]} not found" }.to_json
    end
  else
    # If no specific movie ID is provided, return basic information about all movies
    peliculas = Pelicula.all.map do |pelicula|
      {
        id: pelicula.id,
        imagen_url: pelicula.imagen_url
      }
    end

    peliculas.to_json
  end
end
