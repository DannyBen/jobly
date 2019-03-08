require 'spec_helper'

describe Job do
  it "includes sidekiq worker" do
    expect(described_class).to respond_to :perform_async
  end

  it "includes sidekiq status" do
    expect(subject).to respond_to :expiration
  end

  describe '#perform' do
    let(:params) { [["name", "bob"], ["year", 1987]] }

    it "converts array params to hash and calls execute" do
      expect(subject).to receive(:execute).with(name: 'bob', year: 1987)
      subject.perform params
    end
  end

  describe '#execute' do
    it "is a stub that raises an exception" do
      expect{ subject.execute }.to raise_error NotImplementedError
    end
  end
end