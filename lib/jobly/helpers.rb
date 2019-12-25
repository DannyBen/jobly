module Jobly
  # This module includes all the modules that are needed for a Jobly::Job
  # It may also be included by the user, in a non-job context (for example,
  # in code inside the ./app folder).
  module Helpers
    def self.included(klass)
      klass.class_eval do
        include Logging
        include Settings
        include Shell
        include Slack
      end
    end
  end
end
