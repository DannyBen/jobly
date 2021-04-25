require 'jobly/module_functions'
require 'jobly/api'
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
        use Rack::MethodOverride
        use Rack::Session::Cookie

        if Jobly.auth
          user, pass = Jobly.auth.split ':'
          use Rack::Auth::Basic, "Jobly" do |username, password|
            username == user && password == pass
          end
        end

        run Rack::URLMap.new mounts
      end
    end
  end  
end




