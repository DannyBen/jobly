require 'tty-markdown'

module Jobly
  module Commands
    class InfoCmd < Base
      summary "Show workspace info"
      usage "jobly info"
      usage "jobly info (-h|--help)"

      def run
        raise InfoFileNotFound, info_file unless File.exist? info_file
        puts TTY::Markdown.parse(info, theme: {
          header: [:green, :bold],
          em: [:magenta, :bold],
          hr: :yellow,
          link: [:blue, :underline],
          list: :cyan,
          strong: [:cyan, :bold],
          table: :yellow,
          quote: :magenta
        })
      end

    private
      def info
        @info ||= File.read info_file
      end

      def info_file
        @info_file ||= File.expand_path 'info.md', Jobly.config_path
      end

    end
  end
end
