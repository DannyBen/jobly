require 'spec_helper'

describe Settings do
  subject { Greet.new }

  describe '#settings' do
    it 'returns a Sting object' do
      expect(subject.settings).to be_a Sting
    end

    it 'loads settings.yml from the user config path' do
      expect(subject.settings.host).to eq 'localhost'
    end

    it 'loads extended YAMLs' do
      expect(subject.settings.parent_loaded).to be true
    end

    context 'when Jobly.environment is set' do
      original_environment = Jobly.environment

      before { Jobly.environment = 'production' }
      after { Jobly.environment = original_environment }

      it 'loads settings.<env>.yml from the user config path' do
        expect(subject.settings.host).to eq 'production.com'
        expect(subject.settings.port).to eq 80
      end
    end
  end
end
