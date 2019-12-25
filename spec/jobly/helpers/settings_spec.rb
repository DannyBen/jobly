require 'spec_helper'

describe Settings do
  subject { Greet.new }

  describe '#settings' do
    it "returns a Sting object" do
      expect(subject.settings).to be_a Sting
    end

    it "loads settings.yml from the user config path" do
      expect(subject.settings.host).to eq "localhost"
    end

    context "when Jobly.environment is set" do
      before do
        @original_environment = Jobly.environment
        Jobly.environment = "production"
      end

      after do
        Jobly.environment = @original_environment
      end
      
      it "loads settings.<env>.yml from the user config path" do
        expect(subject.settings.host).to eq "production.com"
        expect(subject.settings.port).to eq 80
      end
    end
  end

end