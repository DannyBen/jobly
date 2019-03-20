require 'fileutils'

module Jobly
  module Commands
    class InitCmd < Base
      summary "Create an initial jobs workspace"
      usage "jobly init NAME [--minimal]"
      usage "jobly init (-h|--help)"
      param "NAME", "The name of the folder to create"
      option "-m --minimal", "Create a minimal workspace"
      example "jobly init test"
      example "jobly init myjobs --minimal"

      def run
        raise ArgumentError, "#{target_dir} already exists" if File.exist? target_dir

        FileUtils.copy_entry source_dir, target_dir

        say "Created #{template} workspace in #{target_dir}:"
        files.each { |file| say "- #{file}" }
      end

    private

      def template
        args['--minimal'] ? 'minimal' : 'full'
      end

      def target_dir
        args['NAME']
      end

      def source_dir
        File.expand_path "../templates/#{template}", __dir__
      end

      def files
        Dir["#{target_dir}/**/{*,.*}"].sort.reject { |f| File.directory? f }
      end
    end
  end
end
