module Jobly
  module JobExtensions
    module Isolation
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def isolated(enabled = true)
          @isolation_enabled = enabled
        end

        def isolated?
          !!@isolation_enabled
        end
      end

      def in_isolation
        Dir.mktmpdir 'jobly-' do |dir|
          Dir.chdir(dir) { yield }
        end
      end

      def isolated?
        self.class.isolated?
      end
    end
  end
end
