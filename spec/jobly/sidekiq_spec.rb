require 'spec_helper'

describe SidekiqBoot do
  describe '::configure' do
    it "configures the client" do
      expect(Sidekiq).to receive(:configure_client)
      described_class.configure
    end

    it "configures the server" do
      expect(Sidekiq).to receive(:configure_server)
      described_class.configure
    end

    context "when logging is enabled" do
      before { Jobly.log = 'spec/tmp/log.log' }
      after  { Jobly.log = nil }
      
      it "sets the sidekick logger" do
        expect(Sidekiq).to receive(:logger).and_return(Logger.new 'spec/tmp/log.log')
        described_class.configure
      end
    end
  end
end