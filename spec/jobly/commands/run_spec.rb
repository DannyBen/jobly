require 'spec_helper'

describe Commands::RunCmd do
  subject { CLI.router }
  
  context "without arguments" do
    it "shows usage" do
      expect{ subject.run %w[run] }.to output_fixture('cli/run/no-args')
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect{ subject.run %w[run --help] }.to output_fixture('cli/run/help')
    end
  end

  context "with a job argument" do
    it "runs the job immediately" do
      expect{ subject.run %w[run Greet] }.to output_fixture('cli/run/greet')
    end

    context "with job parameters" do
      it "runs the job immediately with parameters" do
        expect{ subject.run %w[run Greet name:Bobby] }.to output_fixture('cli/run/greet-params')
      end
    end

    context "with --later" do
      it "sends the job to the work queue" do
        expect(Greet).to receive(:perform_async)
        expect{ subject.run %w[run --later Greet] }.to output_fixture('cli/run/greet-later')
      end

      context "with job parameters" do
        it "sends the job to the work queue with parameters" do
          expect(Greet).to receive(:perform_async).with(name: 'Jenkins')
          expect{ subject.run %w[run --later Greet name:Jenkins] }.to output_fixture('cli/run/greet-later-params')
        end
      end
    end

    context "when there is no such job" do
      it "raises an error" do
        expect{ subject.run %w[run NoJob] }.to raise_error Jobly::JobNotFound
      end
    end
  end

end
