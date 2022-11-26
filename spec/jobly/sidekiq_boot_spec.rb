require 'spec_helper'

describe SidekiqBoot do
  describe '::configure' do
    it 'configures the client' do
      expect(Sidekiq).to receive(:configure_client)
      described_class.configure
    end

    it 'configures the server' do
      expect(Sidekiq).to receive(:configure_server)
      described_class.configure
    end

    context 'when logging is enabled' do
      let(:path) { 'spec/tmp/log.log' }
      let(:log_device) { Sidekiq.logger.instance_variable_get(:@logdev).dev }

      before { Jobly.log = path }
      after  { Jobly.log = nil }

      it 'sets the sidekick logger' do
        described_class.configure
        expect(log_device.path).to end_with(path)
      end
    end
  end
end
