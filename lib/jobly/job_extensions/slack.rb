require 'slack-notifier'

module Jobly
  module JobExtensions
    module Slack
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def slack_channel(channel = nil)
          if channel
            @slack_channel = channel
          else
            @slack_channel ||= Jobly.slack_channel
          end
        end

        def slack_user(user = nil)
          if user
            @slack_user = user
          else
            @slack_user ||= Jobly.slack_user
          end
        end
      end

      def slack
        @slack ||= slack!
      end

    private

      def slack!
        raise ArgumentError, "Slack webhook is not set" unless Jobly.slack_webhook
        opts = {
          channel: self.class.slack_channel,
          username: self.class.slack_user
        }
        ::Slack::Notifier.new Jobly.slack_webhook, opts
      end

    end
  end
end
