require 'remote_syslog_logger'

Jobly.configure do |config|
  # Full configuration file. Everything is optional and has defaults.
  # This file is loaded on boot of the server, worker and jobly CLI.
  # ---

  # environment: development | production
  # Sets the environment for the API Sinatra server and for Sidekiq.
  # Default: ENV['JOBLY_ENVIRONMENT'] || 'development'
  config.environment = 'production'

  # api_url: url
  # Sets the URL to the API server.
  # Default: ENV['JOBLY_API_URL'] || 'http://localhost:3000/do'
  config.api_url = 'http://localhost:3000/do'

  # app_path: relative or absolute path
  # Sets the path to the optional folder that may contain support files for
  # the jobs. All ruby files in this folder are loaded first.
  # Default: ENV['JOBLY_APP_PATH'] || 'app'
  config.app_path = 'app'

  # jobs_path: relative or absolute path
  # Sets the path to the jobs folder. All ruby files in this folder are loaded
  # automatically by all of Jobly's components.
  # Default: ENV['JOBLY_JOBS_PATH'] || 'jobs'
  config.jobs_path = 'jobs'

  # config_path: relative or absolute path
  # Sets the path to the config directory. This is where Jobly looks for this
  # jobly.rb configuration file, so it should be set via the environment
  # variable if you wish to change it.
  # Default: ENV['JOBLY_CONFIG_PATH'] || 'config'
  config.config_path = 'config'

  # redis_url: url
  # Sets the full URL to the redis database
  # Default: ENV['JOBLY_REDIS_URL'] || 'redis://localhost:6379/0'
  config.redis_url = 'redis://localhost:6379/0'

  # status_expiration: minutes
  # Sets the number of minutes that completed jobs are kept in the Statuses
  # tab.
  # Default: ENV['JOBLY_STATUS_EXPIRATION'] || 30
  config.status_expiration = 5

  # jobs_namespace: string
  # Sets the namespace (module name) that your jobs are defined in. For 
  # example, if your Job classes are in fact defined as `MyJobs::SomeJob` 
  # then this option should be set to `MyJobs`.
  # Default: ENV['JOBLY_JOBS_NAMESPACE'] || nil
  config.jobs_namespace = nil

  # logger: logger instance
  # Sets the logger that will be used by the servers and worker. This logger
  # is also available to your jobs with the `logger` method.
  # Default: nil (output to STDOUT)
  config.logger = Logger.new 'jobly.log'

end
