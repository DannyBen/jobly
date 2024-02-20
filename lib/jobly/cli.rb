require 'mister_bin'
require 'jobly/version'

module Jobly
  # Command line interface router. This is called by bin/jobly.
  class CLI
    def self.router
      router = MisterBin::Runner.new version: Jobly::VERSION,
        header: 'Jobly',
        footer: 'Run m`jobly COMMAND --help` for more information'

      router.route 'init',      to: Commands::InitCmd
      router.route 'server',    to: Commands::ServerCmd
      router.route 'worker',    to: Commands::WorkerCmd
      router.route 'send',      to: Commands::SendCmd
      router.route 'run',       to: Commands::RunCmd
      router.route 'config',    to: Commands::ConfigCmd
      router.route 'info',      to: Commands::InfoCmd

      router
    end
  end
end
