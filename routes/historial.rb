require 'sinatra'
require 'json'

# Ruta para obtener el historial de compras de un usuario por ID
get '/usuarios/historial/:id' do
  content_type :json

  user_id = params[:id].to_i

  query = <<-SQL
    SELECT 
      r.idreserva AS reserva_id,
      p.titulo AS pelicula_titulo,
      p.imagen_url AS pelicula_imagen,
      f.fecha_hora,
      s.nombre AS sala_nombre,
      s.direccion AS sala_direccion,
      a.id AS asiento_id,
      a.fila,
      a.columna,
      pr.nombre AS producto_nombre,
      cp.cantidad,
      pr.precio,
      (cp.cantidad * pr.precio) AS total_producto
    FROM 
      reserva r
    LEFT JOIN entrada e ON r.idreserva = e.idreserva
    LEFT JOIN funcion_asiento fa ON e.asientofuncionid = fa.id
    LEFT JOIN funciones f ON fa.funcionid = f.id
    LEFT JOIN peliculas p ON f.pelicula_id = p.id
    LEFT JOIN salas s ON f.sala_id = s.id
    LEFT JOIN asiento a ON fa.asientoid = a.id
    LEFT JOIN compra_productos cp ON r.idreserva = cp.reserva_id
    LEFT JOIN productos pr ON cp.producto_id = pr.id
    WHERE 
      r.userid = ?
  SQL

  resultados = DB.fetch(query, user_id).all

  historial = resultados.group_by { |row| row[:reserva_id] }.map do |reserva_id, detalles|
    {
      reserva_id: reserva_id,
      pelicula: {
        titulo: detalles.first[:pelicula_titulo],
        imagen: detalles.first[:pelicula_imagen]
      },
      fecha_funcion: detalles.first[:fecha_hora],
      sala: {
        nombre: detalles.first[:sala_nombre],
        direccion: detalles.first[:sala_direccion]
      },
      asientos: detalles.map { |d| { id: d[:asiento_id], fila: d[:fila], columna: d[:columna] } }.uniq,
      productos: detalles.select { |d| d[:producto_nombre] }.map do |d|
        {
          nombre: d[:producto_nombre],
          cantidad: d[:cantidad],
          precio: d[:precio],
          total: d[:total_producto]
        }
      end,
      gasto_total: detalles.sum { |d| d[:total_producto] || 0 }
    }
  end

  historial.to_json
end
