module Jobly
  class Job
    include Sidekiq::Worker
    include Sidekiq::Status::Worker
    include JobExtensions::OptionAccessors
    include JobExtensions::Actions
    using KeywordArgs

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
      run_actions actions[:before]

      params.empty? ? execute : execute(params.to_kwargs)

      run_actions actions[:after]
    end

    # Inheriting classes must implement this method only.
    def execute(params={})
      raise NotImplementedError
    end

  end
end
