require 'sinatra'

# Ruta para obtener los asientos disponibles y no disponibles de una función
get '/funciones/:id/asientos' do
  content_type :json

  funcion_id = params[:id].to_i

  # Verificar que la función existe
  funcion = DB.fetch('SELECT * FROM funciones WHERE id = ?', funcion_id).first
  halt 404, { error: 'Función no encontrada' }.to_json unless funcion

  # Obtener asientos totales para la función
  asientos_totales_query = <<-SQL
    SELECT fa.id AS funcion_asiento_id, fa.asientoid
    FROM funcion_asiento fa
    WHERE fa.funcionid = ?
  SQL
  asientos_totales = DB.fetch(asientos_totales_query, funcion_id).all

  # Obtener asientos ocupados para la función
  asientos_ocupados_query = <<-SQL
    SELECT e.asientofuncionid
    FROM entrada e
    JOIN funcion_asiento fa ON e.asientofuncionid = fa.id
    WHERE fa.funcionid = ?
  SQL
  asientos_ocupados = DB.fetch(asientos_ocupados_query, funcion_id).select_map(:asientofuncionid)

  # Determinar asientos disponibles
  asientos_disponibles = asientos_totales.reject { |a| asientos_ocupados.include?(a[:funcion_asiento_id]) }

  {
    disponibles: asientos_disponibles.map { |a| { id: a[:funcion_asiento_id], asiento_id: a[:asientoid] } },
    no_disponibles: asientos_ocupados
  }.to_json
end
