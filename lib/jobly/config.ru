require 'puma'
require 'jobly'
require 'jobly/boot'

mounts = {
  '/'   => Sidekiq::Web, 
  '/do' => Jobly::Server
}

run Rack::URLMap.new mounts
