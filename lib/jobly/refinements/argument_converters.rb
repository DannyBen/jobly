module Jobly
  module ArgumentConverters
    refine Array do
      def to_params
        to_h { |pair| pair.split ':', 2 }.transform_keys(&:to_sym)
      end
    end
  end
end
