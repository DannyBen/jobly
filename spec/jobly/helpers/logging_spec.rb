require 'spec_helper'

describe Logging do
  subject { Greet.new }

  describe '#logger' do
    it "returns a Logger instance" do
      expect(subject.logger).to be_a Logger
    end
  end

end