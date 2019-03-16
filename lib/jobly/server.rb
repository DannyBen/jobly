require 'jobly'
require 'rack'

module Jobly
  class Server
    def self.call(env)
      app.call env
    end

    def self.app
      mounts = {
        '/'   => Sidekiq::Web, 
        '/do' => Jobly::API
      }
      mounts.merge! Jobly.mounts if Jobly.mounts

      Rack::Builder.new do
        use Rack::Auth::Basic do |username, password|
          username == 'user' && password == 'pass'
        end

        run Rack::URLMap.new mounts
      end
    end
  end  
end




