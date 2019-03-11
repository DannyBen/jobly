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

        def actions
          @actions ||= {}
        end
      end

    protected

      def actions
        self.class.actions
      end

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
end
