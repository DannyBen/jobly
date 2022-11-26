class OtherClass
  # If you have classes that do not inherit from Jobly::Job you can still
  # gain access to the helpers by including them.

  # Include all helpers
  include Jobly::Helpers

  # Or, include only what you need
  # include Jobly::Logging
  # include Jobly::Slack
  # include Jobly::Shell
  # include Jobly::Settings
end
