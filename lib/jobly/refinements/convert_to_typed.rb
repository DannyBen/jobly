module Jobly
  module ConvertToTyped
    refine Hash do
      def convert_to_typed
        transform_values do |element|
          element.is_a?(String) ? element.convert_to_typed : element
        end
      end
    end

    refine Array do
      def convert_to_typed
        map do |element|
          element.is_a?(String) ? element.convert_to_typed : element
        end
      end
    end

    refine String do
      def convert_to_typed
        return true  if ['true', 'yes'].include? self
        return false if ['false', 'no'].include? self
        Integer self rescue self
      end
    end
  end
end