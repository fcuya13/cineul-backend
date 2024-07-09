require 'sinatra'
require 'json'

# Ruta para obtener los asientos disponibles y no disponibles de una función
get '/funciones/:id/asientos' do
  content_type :json
  # Habilitar UTF-8 para evitar problemas con caracteres especiales
  headers 'Content-Type' => 'application/json; charset=utf-8'

  funcion_id = params[:id].to_i

  # Verificar que la función existe
  funcion = DB.fetch('SELECT * FROM funciones WHERE id = ?', funcion_id).first
  halt 404, { error: 'Función no encontrada' }.to_json unless funcion

  # Obtener asientos totales para la función incluyendo fila y columna
  asientos_totales_query = <<-SQL
    SELECT fa.id AS funcion_asiento_id, a.id AS asiento_id, a.fila, a.columna
    FROM funcion_asiento fa
    JOIN asiento a ON fa.asientoid = a.id
    WHERE fa.funcionid = ?
  SQL
  asientos_totales = DB.fetch(asientos_totales_query, funcion_id).all

  # Obtener asientos ocupados para la función
  asientos_ocupados_query = <<-SQL
    SELECT e.asientofuncionid, a.id AS asiento_id, a.fila, a.columna
    FROM entrada e
    JOIN funcion_asiento fa ON e.asientofuncionid = fa.id
    JOIN asiento a ON fa.asientoid = a.id
    WHERE fa.funcionid = ?
  SQL
  asientos_ocupados = DB.fetch(asientos_ocupados_query, funcion_id).all

  # Determinar asientos disponibles
  asientos_disponibles = asientos_totales.reject { |a| asientos_ocupados.map { |o| o[:funcion_asiento_id] }.include?(a[:funcion_asiento_id]) }

  {
    disponibles: asientos_disponibles.map { |a| { id: a[:funcion_asiento_id], asiento_id: a[:asiento_id], fila: a[:fila], columna: a[:columna] } },
    no_disponibles: asientos_ocupados.map { |a| { id: a[:asientofuncionid], asiento_id: a[:asiento_id], fila: a[:fila], columna: a[:columna] } }
  }.to_json
end
