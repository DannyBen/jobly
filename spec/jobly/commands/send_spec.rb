require 'spec_helper'

describe Commands::SendCmd do
  require_mock_server!
  
  subject { CLI.router }
  
  context "without arguments" do
    it "shows usage" do
      expect{ subject.run %w[send] }.to output_fixture('cli/send/no-args')
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect{ subject.run %w[send --help] }.to output_fixture('cli/send/help')
    end
  end

  context "with a job argument" do
    it "calls the api" do
      subject.run %w[send Greet]
      expect{ subject.run %w[send Greet] }.to output_fixture('cli/send/greet')
    end

    context "with job parameters" do
      it "calls the api" do
        params = { name: 'Bobby' }
        expect{ subject.run %w[send Greet name:Bobby] }.to output_fixture('cli/send/greet-params')
      end
    end

    context "when the api returns a non-200 code" do
      it "shows the status code" do
        expect{ subject.run %w[send Error] }.to raise_error(Jobly::HTTPError)
      end
    end
  end

end
