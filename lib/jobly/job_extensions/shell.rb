require 'tty-command'

module Jobly
  module JobExtensions
    module Shell
      def run(*args)
        shell.run *args
      end

      def shell
        @shell ||= TTY::Command.new(output: logger, color: false)
      end
    end
  end
end
