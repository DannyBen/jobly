require 'spec_helper'

describe Commands::SendCmd do
  subject { CLI.router }
  
  let(:mock_response) { Struct.new :code, :parse }

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
      url = "http://localhost:3000/do/Greet"
      expect(HTTP).to receive(:get).with(url).and_return(mock_response.new 200, "body")
      expect{ subject.run %w[send Greet] }.to output_fixture('cli/send/greet')
    end

    context "with job parameters" do
      it "calls the api" do
        url = "http://localhost:3000/do/Greet"
        params = { name: 'Bobby' }
        expect(HTTP).to receive(:get).with(url, params: params).and_return(mock_response.new 200, "body")
        expect{ subject.run %w[send Greet name:Bobby] }.to output_fixture('cli/send/greet-params')
      end
    end

    context "when the api returns a non-200 code" do
      it "shows the status code" do
        url = "http://localhost:3000/do/Greet"
        expect(HTTP).to receive(:get).with(url).and_return(mock_response.new 500, "body")
        expect{ subject.run %w[send Greet] }.to output_fixture('cli/send/greet-error')
      end
    end
  end

end
