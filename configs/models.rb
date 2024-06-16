require_relative 'database'

class Pelicula < Sequel::Model(DB[:peliculas])
  one_to_many :pelicula_actores
  one_to_many :pelicula_generos
  many_to_many :actor, join_table: :pelicula_actor, right_key: :actor_id
  many_to_many :genero, join_table: :pelicula_genero, right_key: :genero_id
  one_to_many :funciones
end

class Sala < Sequel::Model(DB[:salas])
  one_to_many :funciones
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

class Funcion < Sequel::Model(DB[:funciones])
  many_to_one :pelicula
  many_to_one :sala
  one_to_many :funcion_asientos
end

class Usuario < Sequel::Model(DB[:usuario])
  one_to_many :reservas
end

class Reserva < Sequel::Model(DB[:reserva])
  many_to_one :usuario
  one_to_many :entradas
  one_to_many :compra_productos
end

class Entrada < Sequel::Model(DB[:entrada])
  many_to_one :reserva
  many_to_one :funcion_asiento
end

class FuncionAsiento < Sequel::Model(DB[:funcion_asiento])
  many_to_one :asiento
  many_to_one :funcion
  one_to_many :entradas
end

class Asiento < Sequel::Model(DB[:asiento])
  one_to_many :funcion_asientos
end

class Producto < Sequel::Model(DB[:productos])
  one_to_many :compra_productos
end

class CompraProducto < Sequel::Model(DB[:compra_productos])
  many_to_one :reserva
  many_to_one :producto
end
