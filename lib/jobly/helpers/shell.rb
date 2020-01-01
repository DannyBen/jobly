require 'tty-command'

module Jobly
  module Shell
    def shell
      @shell ||= shell!
    end

    def shell!
      TTY::Command.new output: logger, 
        color: false,
        dry_run: !!Jobly.shell_dry_run
    end
  end
end
