require 'spec_helper'

describe JobExtensions::OptionAccessors do
  context 'when the job defines options' do
    subject { OptionsJob }

    it 'sets options using accessors' do
      expect { subject.run }.to output_approval('job_extensions/option_accessors')
    end
  end

  context 'when the job does not define options' do
    subject { OptionsDefaultJob }

    it 'uses default values' do
      expect { subject.run }.to output_approval('job_extensions/option_accessors_default')
    end
  end

  context 'when setting options using inheritance' do
    subject { OptionsInheritJob }

    it 'uses default values' do
      expect { subject.run }.to output_approval('job_extensions/option_accessors_inherit')
    end
  end
end
