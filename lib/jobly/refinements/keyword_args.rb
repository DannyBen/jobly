module Jobly
  module KeywordArgs
    refine Hash do
      def to_kwargs
        to_h.transform_keys(&:to_sym)
      end
    end

    refine Array do
      def to_kwargs
        to_h.transform_keys(&:to_sym)
      end
    end
  end
end
