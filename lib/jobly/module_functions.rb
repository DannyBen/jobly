module Jobly
  def self.configure
    yield self
  end

  def self.load_custom_config
    require config_file if File.exist? config_file
  end

  def self.default_options
    {
      environment: ENV['JOBLY_ENVIRONMENT'] || 'development',
      api_base: ENV['JOBLY_API_URL'] || 'http://localhost:3000/do',
      app_path: ENV['JOBLY_APP_PATH'] || 'app',
      jobs_path: ENV['JOBLY_JOBS_PATH'] || "jobs",
      config_path: ENV['JOBLY_CONFIG_PATH'] || "config",
      redis_url: ENV['JOBLY_REDIS_URL'] || "redis://localhost:6379/0",
      status_expiration: 30,
      jobs_namespace: nil,
      logger: nil,
    }
  end

  def self.method_missing(method, args=nil, &_block)
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

  def self.respond_to_missing?(method, include_private=false)
    key = method.to_s.chomp('=').to_sym
    options.has_key?(key) ? true : super
  end

  def self.options
    @options ||= default_options.dup
  end

  def self.full_app_path
    File.expand_path app_path
  end

  def self.full_jobs_path
    File.expand_path jobs_path
  end

  def self.full_config_path
    File.expand_path config_path
  end

  def self.config_file
    File.expand_path 'jobly.rb', self.config_path
  end

  def self.custom_config?
    File.exist? config_file
  end
end
