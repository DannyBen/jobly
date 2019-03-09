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

  describe '::full_job_name' do
    it "returns job class as a string" do
      expect(described_class.full_job_name 'Hello').to eq 'Hello'
    end

    context "when the input contains a slash" do
      it "replaces it with ::" do
        expect(described_class.full_job_name 'App/World').to eq 'App::World'
      end
    end

    context "when Jobly.jobs_namespace is set" do
      before { Jobly.jobs_namespace = 'Hello' }
      after  { Jobly.jobs_namespace = nil }

      it "returns namespace::job" do
        expect(described_class.full_job_name 'World').to eq 'Hello::World'
      end

      context "when the input contains a slash" do
        it "replaces it with ::" do
          expect(described_class.full_job_name 'App/World').to eq 'Hello::App::World'
        end
      end
    end

  end
end