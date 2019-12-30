module Jobly
  module Logging
    using ToSlug

    def logger
      @logger ||= logger!
    end

    def logger!
      logger = if !Jobly.log
        Sidekiq.logger
      elsif Jobly.log.is_a? Logger
        Jobly.log
      else
        Log.new Jobly.full_log_path, self.class.name.to_slug
      end

      logger.level = Jobly.log_level if logger and logger.respond_to? :level
      logger
    end
  end
end
