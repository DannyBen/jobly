require 'fileutils'

module Jobly
  module Commands
    class InitCmd < Base
      summary "Create an initial jobs workspace"
      usage "jobly init NAME [--minimal]"
      usage "jobly init (-h|--help)"
      param "NAME", "The name of the folder to create"
      option "-m, --minimal", "Create a simpler setup with less files"
      example "jobly init test"
      example "jobly init myjobs --minimal"

      def run
        minimal = args['--minimal']
        target = args['NAME']
        
        raise ArgumentError, "#{target} already exists" if File.exist? target

        template = minimal ? "minimal" : "full"
        source = File.expand_path "../templates/#{template}", __dir__

        FileUtils.copy_entry source, target

        say "Created #{template} workspace in #{target}:"

        files = Dir["#{target}/**/{*,.*}"].sort.reject { |f| File.directory? f }
        files.each do |file|
          say "- #{file}"
        end
      end
    end
  end
end
