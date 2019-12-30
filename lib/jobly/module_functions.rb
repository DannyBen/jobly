module Jobly
  class << self
    def configure
      yield self
    end

    def load_custom_config
      require config_file if File.exist? config_file
    end

    def default_options
      {
        root: Dir.pwd,
        environment: ENV['JOBLY_ENVIRONMENT'] || 'development',
        api_url: ENV['JOBLY_API_URL'] || 'http://localhost:3000/do',
        app_path: ENV['JOBLY_APP_PATH'] || 'app',
        jobs_path: ENV['JOBLY_JOBS_PATH'] || "jobs",
        config_path: ENV['JOBLY_CONFIG_PATH'] || "config",
        redis_url: ENV['JOBLY_REDIS_URL'] || "redis://localhost:6379/0",
        status_expiration: ENV['JOBLY_STATUS_EXPIRATION']&.to_i || 30,
        jobs_namespace: ENV['JOBLY_JOBS_NAMESPACE'],
        slack_webhook: ENV['JOBLY_SLACK_WEBHOOK'],
        slack_channel: ENV['JOBLY_SLACK_CHANNEL'] || "#general",
        slack_user: ENV['JOBLY_SLACK_USER'] || "Jobly",
        log: ENV['JOBLY_LOG'],
        log_level: ENV['JOBLY_LOG_LEVEL'] || 'info',
        auth: ENV['JOBLY_AUTH'],
        mounts: nil,
      }
    end

    def method_missing(method, args=nil, &_block)
      key = method.to_s
      assign = key[-1] == "="
      key = key.chomp('=') if assign
      key = key.to_sym

      if options.has_key? key
        assign ? options[key] = args : options[key]
      else
        super
      end
    end

    def respond_to_missing?(method, include_private=false)
      key = method.to_s.chomp('=').to_sym
      options.has_key?(key) ? true : super
    end

    def options
      @options ||= default_options.dup
    end

    def logger
      @logger
    end

    def log=(target)
      options[:log] = target
      @logger = if target.is_a? Logger
        target
      elsif target
        Log.new target, :jobly
      else
        nil
      end

      @logger.level = log_level if @logger and @logger.respond_to? :level
      @logger
    end

    def full_app_path
      File.expand_path app_path, root
    end

    def full_jobs_path
      File.expand_path jobs_path, root
    end

    def full_config_path
      File.expand_path config_path, root
    end

    def full_log_path
      File.expand_path log, root
    end

    def config_file
      File.expand_path 'jobly.rb', full_config_path
    end

    def custom_config?
      File.exist? config_file
    end
  end
end
