require 'tty-command'

module Jobly
  module Shell
    def shell
      @shell ||= shell!
    end

    def shell!
      TTY::Command.new output: logger, 
        color: false,
        dry_run: !!ENV['JOBLY_SHELL_DRY_RUN']
    end
  end
end
