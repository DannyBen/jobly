require 'spec_helper'

describe Shell do
  subject { Greet.new }

  describe '#shell' do
    it 'returns a TTY::Command instance' do
      expect(subject.shell).to be_a TTY::Command
    end

    it 'does not enable dry_run mode' do
      expect(subject.shell).not_to be_dry_run
    end

    context 'when Jobly.shell_dry_run is true' do
      before { Jobly.shell_dry_run = true }
      after  { Jobly.shell_dry_run = false }

      it 'enables dry_run mode' do
        expect(subject.shell.dry_run?).to be true
      end
    end
  end
end
