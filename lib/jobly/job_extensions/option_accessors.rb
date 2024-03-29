module Jobly
  module JobExtensions
    module OptionAccessors
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def options
          sidekiq_options
        end

        def queue(name)
          options['queue'] = name
        end

        def retries(count)
          options['retry'] = count
        end

        def backtrace(count)
          options['backtrace'] = count
        end
      end

      def options
        # sidekiq_options_hash   # is this better?
        self.class.options
      end
    end
  end
end
