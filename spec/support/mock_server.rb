require 'sinatra'
require 'debug'

set :port, 3000
set :bind, '0.0.0.0'

def json(hash)
  content_type :json
  JSON.pretty_generate hash
end

def authorized?
  auth ||= Rack::Auth::Basic::Request.new(request.env)
  auth.provided? and auth.basic? and auth.credentials and auth.credentials == %w[bill dollar]
end

def require_auth
  return if authorized?

  response['WWW-Authenticate'] = %[Basic realm="Restricted Area"]
  throw(:halt, [401, "Unauthorized\n"])
end

get '/' do
  json mockserver: :online
end

get '/do/Error' do
  status 500
  json error: 'You asked for it...'
end

get '/do/*' do
  json received: params
end

get '/secure/*' do
  require_auth
  json received: params
end
