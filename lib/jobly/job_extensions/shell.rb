require 'tty-command'

module Jobly
  module JobExtensions
    module Shell
      def shell
        @shell ||= TTY::Command.new(output: logger, color: false)
      end
    end
  end
end
