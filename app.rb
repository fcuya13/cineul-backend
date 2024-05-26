require 'sinatra'
require 'sequel'

set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'
set :protection, except: :frame_options
set :bind, '0.0.0.0'
set :port, 8080

DB = Sequel.sqlite('db/app.db')
Sequel::Model.plugin :json_serializer
class Pelicula < Sequel::Model(DB[:peliculas])
  one_to_many :pelicula_actores
  one_to_many :pelicula_generos
  many_to_many :actor, join_table: :pelicula_actor, right_key: :actor_id
  many_to_many :genero, join_table: :pelicula_genero, right_key: :genero_id
end

class Sala < Sequel::Model(DB[:salas])
end

class PeliculaActor < Sequel::Model(DB[:pelicula_actor])
  many_to_one :pelicula
  many_to_one :actor
end

class PeliculaGenero < Sequel::Model(DB[:pelicula_genero])
  many_to_one :pelicula
  many_to_one :genero
end

class Actor < Sequel::Model(DB[:actor])
  one_to_many :pelicula_actores
  many_to_many :peliculas, join_table: :pelicula_actor, right_key: :pelicula_id
end

class Genero < Sequel::Model(DB[:genero])
  one_to_many :pelicula_generos
  many_to_many :peliculas, join_table: :pelicula_genero, right_key: :pelicula_id
end

get '/' do
  erb :home
end

get '/peliculas' do
  content_type :json

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

  peliculas.to_json
end

get '/salas' do
  Sala.all.to_a.to_json
end

