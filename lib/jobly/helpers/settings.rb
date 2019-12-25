require 'sting'

module Jobly
  module Settings
    def settings
      @settings ||= settings!
    end

    def settings!
      settings = Sting.new

      files = [
        "#{Jobly.full_config_path}/settings",
        "#{Jobly.full_config_path}/settings.#{Jobly.environment}"
      ]

      files.each do |file|
        settings << file if File.exist? "#{file}.yml"
      end

      settings
    end
  end
end
