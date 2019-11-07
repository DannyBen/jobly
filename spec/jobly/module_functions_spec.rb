require 'spec_helper'

describe Jobly do
  let(:string_getters) do 
    %i[
      environment api_url app_path full_app_path jobs_path full_jobs_path
      config_path full_config_path redis_url slack_channel slack_user
    ]
  end

  let(:other_getters) do
    %i[
      auth log logger jobs_namespace status_expiration slack_webhook
    ]
  end

  it "has string options" do
    string_getters.each do |method|
      expect(described_class).to respond_to(method), "with #{method}"
      expect(described_class.send method).to be_a(String), "with #{method}"
    end
  end

  it "has other options" do
    other_getters.each do |method|
      expect(described_class).to respond_to(method), "with #{method}"
    end
  end

  describe '::method_missing' do
    it "raises an error when there is no such option" do
      expect{ described_class.nada }.to raise_error(NoMethodError)
    end
  end

  describe '::log=' do
    after { described_class.log = nil }

    it "refreshes the ::logger as well" do
      expect(described_class.logger).to be_nil

      described_class.log = 'spec/tmp/out.log'

      expect(described_class.logger.instance_variable_get(:@logdev).dev.inspect)
        .to eq "#<File:spec/tmp/out.log>"
    end
  end

  describe '::logger' do
    context "when Job.log is nil" do
      it "returns nil" do
        expect(described_class.logger).to be_nil
      end
    end

    context "when Job.log is not nil" do
      before { described_class.log = 'spec/tmp/log.log' }
      after { described_class.log = nil }

      it "returns a Logger" do
        expect(described_class.logger).to be_a Logger
      end
    end

    context "when Jobly.log is a syslog connection string" do
      before { described_class.log = 'syslog://' }
      after { described_class.log = nil }

      it "returns a RemoteSyslogLogger" do
        expect(described_class.logger.instance_variable_get(:@logdev).dev)
          .to be_a RemoteSyslogLogger::UdpSender
      end
    end
  end

  describe '::configure' do
    it "yields self" do
      yielded_instance = nil
      described_class.configure { |config| yielded_instance = config }
      expect(yielded_instance).to be_a described_class
    end
  end
end
