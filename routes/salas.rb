# frozen_string_literal: true

require 'sinatra'


get '/salas' do
  Sala.all.to_a.to_json
end
