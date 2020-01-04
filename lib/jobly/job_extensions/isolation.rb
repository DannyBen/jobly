module Jobly
  module JobExtensions
    module Isolation
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        attr_reader :isolate

        def isolated(enabled = true)
          @isolate = enabled
        end
      end

      def in_isolation
        Dir.mktmpdir 'jobly-' do |dir|
          Dir.chdir(dir) { yield }
        end
      end

      def isolated?
        self.class.isolate
      end
    end
  end
end
