require 'pathname'

module Jobly
  module Commands
    class ConfigCmd < Base
      summary "Show configuration options"
      usage "jobly config"
      usage "jobly config (-h|--help)"

      def run
        line "custom config file", short_config_path, !Jobly.custom_config?
        Jobly.options.each do |key, value|
          if key.to_s.end_with? '_path'
            line key, value, !Dir.exist?(value)
          else
            line key, value
          end
        end
      end

    private

      def short_config_path
        Jobly.config_file.sub "#{Dir.pwd}", '.'
      end

      def line(key, value, attention=false)
        color = attention ? '!txtred!' : '!txtgrn!'
        say "#{key.to_s.rjust 20}  #{color}#{value.to_s.strip}"
      end

    end
  end
end
