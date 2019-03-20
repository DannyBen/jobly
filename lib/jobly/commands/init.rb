require 'fileutils'

module Jobly
  module Commands
    class InitCmd < Base
      summary "Create an initial Jobs workspace"
      usage "jobly init NAME [--minimal]"
      usage "jobly init (-h|--help)"
      param "NAME", "The name of the folder to create"
      option "-m, --minimal", "Create a simpler setup with less files"
      example "jobly init test"
      example "jobly init myjobs --minimal"

      def run
        minimal = args['--minimal']
        template = minimal ? "minimal" : "full"
        
        source = File.expand_path "../templates/#{template}", __dir__
        target = args['NAME']

        FileUtils.mkdir_p target

        Dir.chdir target do
          FileUtils.copy_entry source, target
        end

        say "Created #{template} workspace in #{target}"
      end
    end
  end
end
