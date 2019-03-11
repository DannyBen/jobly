require 'spec_helper'

describe Job do
  it "includes sidekiq worker" do
    expect(described_class).to respond_to :perform_async
  end

  it "includes sidekiq status" do
    expect(subject).to respond_to :expiration
  end

  describe '::execute_async' do
    it "behaves as ::perform_async" do
      # TODO: Can we test this better?
      expect(described_class).to respond_to :perform_async
    end
  end

  describe '::execute' do
    it "calls execute on a new instance" do
      expect_any_instance_of(described_class).to receive(:execute).with name: 'jill'
      described_class.execute name: 'jill'
    end
  end

  describe '::before and ::after' do
    subject { Sleep }

    it "run blocks of code around #perform" do
      expect{ subject.perform this_many: 7 }.to output_fixture('job/before-after')
    end
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