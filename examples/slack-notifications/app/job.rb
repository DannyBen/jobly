require 'slack-notifier'

class Job < Jobly::Job
  def slack
    @slack ||= slack!
  end

  def slack!
    Slack::Notifier.new webhook, channel: "#general", username: "Bot"
  end

  def webhook
    ENV['SLACK_WEBHOOK']
  end
end