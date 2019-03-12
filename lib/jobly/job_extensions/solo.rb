module Jobly
  module JobExtensions
    module Solo
      include Actions

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
      end

    end
  end
end
