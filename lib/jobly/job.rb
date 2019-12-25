module Jobly
  class Job
    include Sidekiq::Worker
    include Sidekiq::Status::Worker
    include JobExtensions::OptionAccessors
    include JobExtensions::Actions
    include JobExtensions::Solo

    # Helpers must come after Sidekiq::Worker since they both bring logger
    # and our logger is the king of loggers
    include Helpers

    using KeywordArgs
    using ToSlug

    sidekiq_options retry: 5, backtrace: 5
    attr_reader :params

    class << self
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

    end

    # This is the method sidekiq will call. We capture this call and convert
    # the hash argument which was converted to array on sidekiq's side, back
    # to a hash so we can forward to the job's `execute` method, which may 
    # implement keyword args.
    def perform(params={})
      @params = params
      run_to_completion if run_before_filter
    end

    # Inheriting classes must implement this method only.
    def execute(params={})
      raise NotImplementedError
    end

  private

    def run_before_filter
      run_actions :before
      if skipped?
        run_actions :skip
        run_actions :after
        return false
      end
      return true
    end

    def run_to_completion
      params.empty? ? execute : execute(params.to_kwargs)
      run_actions :success

    rescue
      run_actions :failure
      raise
    
    ensure
      run_actions :after
      
    end
  end
end
