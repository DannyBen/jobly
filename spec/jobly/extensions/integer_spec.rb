require 'spec_helper'

describe Integer do
  describe '#seconds' do
    it "returns the number of seconds" do
      expect(5.seconds).to eq 5
      expect(1.second ).to eq 1
    end
  end

  describe '#minutes' do
    it "returns the number of seconds" do
      expect(5.minutes).to eq 5 * 60
      expect(1.minute ).to eq 1 * 60
    end
  end

  describe '#hours' do
    it "returns the number of seconds" do
      expect(5.hours).to eq 5 * 60 * 60
      expect(1.hour ).to eq 1 * 60 * 60
    end
  end

  describe '#days' do
    it "returns the number of seconds" do
      expect(5.days).to eq 5 * 24 * 60 * 60
      expect(1.day ).to eq 1 * 24 * 60 * 60
    end
  end
end
