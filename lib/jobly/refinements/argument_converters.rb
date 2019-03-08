module Jobly
  module ArgumentConverters
    refine Array do
      def to_params
        map { |pair| pair.split ':' }.to_h.transform_keys(&:to_sym)
      end
    end
  end
end