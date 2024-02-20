require 'debug' if ENV['DEBUGGER']

module Jobly
  autoload :API, 'jobly/api'
  autoload :CLI, 'jobly/cli'
  autoload :Helpers, 'jobly/helpers'
  autoload :Job, 'jobly/job'
  autoload :Jobs, 'jobly/jobs'
  autoload :Log, 'jobly/log'
  autoload :Server, 'jobly/server'
  autoload :SidekiqBoot, 'jobly/sidekiq'

  # helpers
  autoload :Logging, 'jobly/helpers/logging'
  autoload :Settings, 'jobly/helpers/settings'
  autoload :Shell, 'jobly/helpers/shell'
  autoload :Slack, 'jobly/helpers/slack'

  # refinements
  autoload :ArgumentConverters, 'jobly/refinements/argument_converters'
  autoload :ConvertToTyped, 'jobly/refinements/convert_to_typed'
  autoload :KeywordArgs, 'jobly/refinements/keyword_args'
  autoload :ToSlug, 'jobly/refinements/to_slug'

  # job_extensions
  module JobExtensions
    autoload :Actions, 'jobly/job_extensions/actions'
    autoload :Isolation, 'jobly/job_extensions/isolation'
    autoload :OptionAccessors, 'jobly/job_extensions/option_accessors'
    autoload :Solo, 'jobly/job_extensions/solo'
  end

  # commands

  module Commands
    autoload :Base, 'jobly/commands/base'
    autoload :ConfigCmd, 'jobly/commands/config'
    autoload :InfoCmd, 'jobly/commands/info'
    autoload :InitCmd, 'jobly/commands/init'
    autoload :RunCmd, 'jobly/commands/run'
    autoload :SendCmd, 'jobly/commands/send'
    autoload :ServerCmd, 'jobly/commands/server'
    autoload :WorkerCmd, 'jobly/commands/worker'
  end
end

require 'jobly/extensions/integer'
require 'jobly/exceptions'
require 'jobly/module_functions'
