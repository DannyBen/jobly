module Jobly
  class Job
    include Sidekiq::Worker
    include Sidekiq::Status::Worker

    # Set some more appropriate defaults
    sidekiq_options retry: 5, backtrace: 5

    class << self
      # Allow inheriting jobs to use `options` instead of `sidekiq_options`
      alias_method :options, :sidekiq_options

      # Allow inheriting jobs to use `execute_async` instead of 
      # `perform_async` for consistency with `execute`
      alias_method :execute_async, :perform_async

      # Allow calling a job with `JobName.execute` instead of 
      # `JobName.new.execute`, for consistency.
      def execute(*args)
        new.execute *args
      end

      # Allow calling a job with `JobName.perform` instead of 
      # `JobName.new.perform`, for consistency.
      def perform(*args)
        new.perform *args
      end

      # Add support for running code before execution
      def before(&block)
        before_blocks << block
      end

      # Add support for running code after execution
      def after(&block)
        after_blocks << block
      end

      def before_blocks
        @before_blocks ||= []
      end

      def after_blocks
        @after_blocks ||= []
      end

    end

    attr_reader :params

    # This is the method sidekiq will call. We capture this call and convert
    # the hash argument which was converted to array on sidekiq's side, back
    # to a hash so we can forward to the job's `execute` method, which may 
    # implement keyword args.
    def perform(params={})
      @params = params

      self.class.before_blocks.each do |block|
        instance_eval &block
      end

      params = params.to_h.transform_keys(&:to_sym)
      params.empty? ? execute : execute(params)

      self.class.after_blocks.each do |block|
        instance_eval &block
      end

    end

    # Inheriting classes must implement this method only.
    def execute(params={})
      raise NotImplementedError
    end

  end
end
