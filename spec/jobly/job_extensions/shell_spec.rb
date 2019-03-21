require 'spec_helper'

describe JobExtensions::Shell do
  subject { Greet.new }

  describe '#shell' do
    it "returns a TTY::Command instance" do
      expect(subject.shell).to be_a TTY::Command
    end
  end

  describe '#run' do
    it "calls TTY::Command#run" do
      expect(subject.shell).to receive(:run).with "whoami"
      subject.run "whoami"      
    end
  end

end