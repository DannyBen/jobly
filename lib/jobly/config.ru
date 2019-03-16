require 'puma'
require 'jobly'
require 'jobly/boot'

mounts = {
  '/'   => Sidekiq::Web, 
  '/do' => Jobly::Server
}

mounts.merge! Jobly.mounts if Jobly.mounts

if ENV['JOBLY_TEST_MODE']
  lp mounts
else
  run Rack::URLMap.new mounts
end
