require 'sinatra'
require 'sequel'

set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'
set :protection, except: :frame_options
set :bind, '0.0.0.0'
set :port, 8080

DB = Sequel.sqlite('db/app.db')

get '/' do
  erb :home
end

get '/hola' do
  'hola'
end
