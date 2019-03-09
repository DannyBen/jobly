require 'spec_helper'

describe Commands::WorkerCmd do
  subject { CLI.router }

  context "without arguments" do
    it "runs sidekiq" do
      command = /sidekiq --environment development --require ".*boot.rb" --concurrency 4/
      expect_any_instance_of(described_class).to receive(:exec).with(command)
      expect{ subject.run %w[worker] }.to output_fixture('cli/worker/no-args')
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect{ subject.run %w[worker --help] }.to output_fixture('cli/worker/help')
    end
  end

  context "with --config" do
    it "points to a worker config file" do
      command = /sidekiq .* --config "spec\/fixtures\/config\/worker.yml"/
      expect_any_instance_of(described_class).to receive(:exec).with(command)
      expect{ subject.run %w[worker --config worker] }.to output_fixture('cli/worker/config')
    end

    context "when the config file is not found" do
      it "raises an error" do 
        expect{ subject.run %w[worker --config notfound] }.to raise_error(ArgumentError)
      end
      
    end
  end
end
