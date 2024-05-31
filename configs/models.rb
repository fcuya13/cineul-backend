require_relative 'database'

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
end# frozen_string_literal: true

