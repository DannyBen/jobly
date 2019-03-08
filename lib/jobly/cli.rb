require 'mister_bin'
requires 'commands/base', 'commands'

module Jobly

  # Command line interface router. This is called by bin/jobly.
  class CLI
    def self.router
      router = MisterBin::Runner.new version: VERSION,
        header: "Jobly",
        footer: "Run !txtpur!jobly COMMAND --help!txtrst! for more information"

      router.route 'server',    to: Commands::ServerCmd
      router.route 'worker',    to: Commands::WorkerCmd
      router.route 'send',      to: Commands::SendCmd
      router.route 'run',       to: Commands::RunCmd
      router.route 'config',    to: Commands::ConfigCmd

      router
    end
  end

end
