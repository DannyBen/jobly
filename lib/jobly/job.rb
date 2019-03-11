module Jobly
  class Job
    include Sidekiq::Worker
    include Sidekiq::Status::Worker
    include JobExtensions::OptionAccessors

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

      # Add support for running code before execution
      def before(sym = nil, &block)
        actions[:before] ||= []
        actions[:before] << (sym || block)
      end

      # Add support for running code after execution
      def after(sym = nil, &block)
        actions[:after] ||= []
        actions[:after] << (sym || block)
      end

      def actions
        @actions ||= {}
      end

    end

    # This is the method sidekiq will call. We capture this call and convert
    # the hash argument which was converted to array on sidekiq's side, back
    # to a hash so we can forward to the job's `execute` method, which may 
    # implement keyword args.
    def perform(params={})
      @params = params
      run_actions self.class.actions[:before]

      params = params.to_h.transform_keys(&:to_sym)
      params.empty? ? execute : execute(params)

      run_actions self.class.actions[:after]
    end

    # Inheriting classes must implement this method only.
    def execute(params={})
      raise NotImplementedError
    end

  protected

    def run_actions(list)
      return unless list

      list.each do |action|
        if action.is_a? Symbol
          send action
        else
          instance_eval &action
        end
      end
    end

  end
end
