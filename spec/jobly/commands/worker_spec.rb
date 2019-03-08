require 'spec_helper'

describe Commands::WorkerCmd do
  subject { CLI.router }

  context "without arguments" do
    it "runs sidekiq" do
      command = /sidekiq --environment development --concurrency 4 --require .*boot.rb/
      expect_any_instance_of(described_class).to receive(:exec).with(command)
      expect{ subject.run %w[worker] }.to output_fixture('cli/worker/no-args')
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect{ subject.run %w[worker --help] }.to output_fixture('cli/worker/help')
    end
  end
end
