require 'spec_helper'

describe Jobs do
  describe '::get_class' do
    it "returns a job class" do
      expect(described_class.get_class 'Greet').to eq Greet
    end

    context "with an invalid job name" do
      it "returns nil" do
        expect(described_class.get_class 'NoGood').to be_nil
      end
    end
  end

  describe '::get_class!' do
    it "returns a job class" do
      expect(described_class.get_class! 'Greet').to eq Greet
    end

    context "with an invalid job name" do
      it "raises JobNotFound" do
        expect{ described_class.get_class! 'NoGood' }.to raise_error JobNotFound
      end
    end
  end

  describe '::namespaced_job' do
    it "returns job class as a string" do
      expect(described_class.namespaced_job 'Hello').to eq 'Hello'
    end

    context "when Jobly.jobs_namespace is set" do
      before { Jobly.jobs_namespace = 'Hello' }
      after  { Jobly.jobs_namespace = nil }

      it "returns namespace::job" do
        expect(described_class.namespaced_job 'World').to eq 'Hello::World'
      end
    end
  end
end