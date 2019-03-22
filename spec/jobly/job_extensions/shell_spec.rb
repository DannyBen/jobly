require 'spec_helper'

describe JobExtensions::Shell do
  subject { Greet.new }

  describe '#shell' do
    it "returns a TTY::Command instance" do
      expect(subject.shell).to be_a TTY::Command
    end
  end

end