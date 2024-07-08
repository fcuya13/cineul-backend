require 'sinatra'
require 'sequel'
require 'json'

set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'
set :protection, except: :frame_options
set :bind, '0.0.0.0'
set :port, 4567

require_relative 'configs/database'

require_relative 'configs/models'

Dir[File.join(__dir__, 'routes', '*.rb')].each { |file| require_relative file }

before do
  content_type :json, charset: 'utf-8'
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
          'Access-Control-Allow-Headers' => 'Content-Type'
end

options '*' do
  response.headers['Allow'] = 'HEAD,GET,PUT,POST,DELETE,OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
  200
end

get '/' do
  erb :home
end
