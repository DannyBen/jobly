require 'spec_helper'

describe Shell do
  subject { Greet.new }

  describe '#shell' do
    it "returns a TTY::Command instance" do
      expect(subject.shell).to be_a TTY::Command
    end

    it "does not enable dry_run mode" do
      expect(subject.shell.dry_run?).to be false
    end

    context "when JOBLY_SHELL_DRY_RUN is set" do
      before { ENV['JOBLY_SHELL_DRY_RUN'] = '1' }
      after  { ENV['JOBLY_SHELL_DRY_RUN'] = nil }

      it "enables dry_run mode" do
        expect(subject.shell.dry_run?).to be true
      end
    end
  end

end