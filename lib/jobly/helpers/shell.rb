require 'tty-command'

module Jobly
  module Shell
    def shell
      @shell ||= TTY::Command.new(output: logger, color: false)
    end
  end
end
