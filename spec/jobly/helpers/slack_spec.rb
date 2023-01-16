require 'spec_helper'

describe Slack do
  subject { SlackJob.new }

  let(:webhook) { 'http://some.hook' }
  let(:opts) { { channel: '#spec', username: 'RSpec' } }

  before { Jobly.slack_webhook = webhook }
  after { Jobly.slack_webhook = nil }

  describe '#slack' do
    subject { Greet.new }

    let(:opts) { { channel: '#general', username: 'Jobly' } }

    it 'returns a Slack::Notifier instance' do
      expect(Slack::Notifier).to receive(:new).with(webhook, opts)
      subject.slack
    end

    context 'when slack_webhook is not set' do
      before { Jobly.slack_webhook = nil }

      it 'raises ArgumentError' do
        expect { subject.slack }.to raise_error(ArgumentError, 'Slack webhook is not set')
      end
    end
  end

  describe '::slack_channel / ::slack_user' do
    it 'sets and gets slack channel' do
      expect(Slack::Notifier).to receive(:new).with(webhook, opts)
      subject.slack
    end
  end
end
