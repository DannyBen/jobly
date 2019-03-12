module Jobly
  module JobExtensions
    module Actions
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def before(sym = nil, &block)
          actions[:before] ||= []
          actions[:before] << (sym || block)
        end

        def after(sym = nil, &block)
          actions[:after] ||= []
          actions[:after] << (sym || block)
        end

        def on_success(sym = nil, &block)
          actions[:success] ||= []
          actions[:success] << (sym || block)
        end

        def on_failure(sym = nil, &block)
          actions[:failure] ||= []
          actions[:failure] << (sym || block)
        end

        def on_skip(sym = nil, &block)
          actions[:skip] ||= []
          actions[:skip] << (sym || block)
        end

        def actions
          @actions ||= {}
        end
      end

      def skip_job(reason=nil)
        @skipped = true
      end

      def skipped?
        @skipped
      end

    protected

      def actions
        self.class.actions
      end

      def run_actions(list)
        return unless actions[list]

        actions[list].each do |action|
          if action.is_a? Symbol
            send action
          else
            instance_eval &action
          end
        end
      end

    end
  end
end
