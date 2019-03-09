require 'tty-command'

class Job < Jobly::Job
  # Provide a common way for the inheriting jobs to run shell commands
  # and send output to the common logger.
  def shell
    @shell ||= TTY::Command.new(output: logger, color: false)
  end
end