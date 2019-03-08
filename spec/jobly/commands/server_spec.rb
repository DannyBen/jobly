require 'spec_helper'

describe Commands::ServerCmd do
  subject { CLI.router }

  context "without arguments" do
    it "runs the dashboard and api server" do
      command = /rackup --env development --port 3000 --host 0.0.0.0 .*lib\/jobly\/config\.ru/
      expect_any_instance_of(described_class).to receive(:exec).with(command)
      expect{ subject.run %w[server] }.to output_fixture('cli/server/no-args')
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect{ subject.run %w[server --help] }.to output_fixture('cli/server/help')
    end
  end
end
