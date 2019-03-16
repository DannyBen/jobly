require 'sinatra'
require 'byebug'

set :port, 3000
set :bind, '0.0.0.0'

def json(hash)
  content_type :json
  JSON.pretty_generate hash
end

get '/' do
  json mockserver: :online
end

get '/do/Error' do
  status 500
  json error: "You asked for it..."
end

get '/do/*' do
  json received: params
end
