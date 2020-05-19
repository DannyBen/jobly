require 'spec_helper'

describe Commands::ConfigCmd do
  subject { CLI.router }

  context "without arguments" do
    it "shows config options" do
      expect{ subject.run %w[config] }.to output_approval('cli/config/no-args')
        .except(/custom config file  .*jobly.rb/, "custom config file  ...jobly.rb")
        .except(/root  .*jobly/, "root  ...jobly")
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect{ subject.run %w[config --help] }.to output_approval('cli/config/help')
    end
  end
end
