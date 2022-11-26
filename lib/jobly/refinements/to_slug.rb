module Jobly
  module ToSlug
    refine String do
      def to_slug
        downcase.gsub(/[^\w]/, ' ').strip.squeeze(' ').tr(' ', '-')
      end
    end
  end
end
