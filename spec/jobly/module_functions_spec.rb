require 'spec_helper'

describe Jobly do
  let(:string_getters) do 
    %i[
      environment api_base app_path full_app_path jobs_path full_jobs_path
      config_path full_config_path redis_url 
    ]
  end

  let(:other_getters) do
    %i[
      logger jobs_namespace status_expiration
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

  describe '::configure' do
    it "yields self" do
      yielded_instance = nil
      described_class.configure { |config| yielded_instance = config }
      expect(yielded_instance).to be_a described_class
    end
  end
end