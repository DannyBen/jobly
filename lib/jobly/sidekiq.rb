require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq-status'
require 'sidekiq-status/web'

module Jobly
  module SidekiqBoot
    def self.configure
      Sidekiq.configure_client do |config|
        config.redis = { url: Jobly.redis_url }
        Sidekiq::Status.configure_client_middleware config, expiration: 60 * 60
      end

      Sidekiq.configure_server do |config|
        # :nocov:
        config.redis = { url: Jobly.redis_url }

        Sidekiq::Status.configure_server_middleware config, expiration: Jobly.status_expiration * 60
        Sidekiq::Status.configure_client_middleware config, expiration: Jobly.status_expiration * 60
        # :nocov:
      end

      if Jobly.log
        Sidekiq.logger = Log.new Jobly.log, :sidekiq
      end
    end
  end
end
