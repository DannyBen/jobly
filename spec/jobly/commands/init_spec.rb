require 'spec_helper'

describe Commands::InitCmd do
  subject { CLI.router }

  context "without arguments" do
    it "shows usage" do
      expect{ subject.run %w[init] }.to output_fixture('cli/init/no-args')
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect{ subject.run %w[init --help] }.to output_fixture('cli/init/help')
    end
  end

  context "with NAME" do
    let(:name) { "scaffold" }
    let(:dir) { "spec/tmp/#{name}" }
    
    before { system "rm -rf #{dir}" if File.exist? dir }
    after  { system "rm -rf #{dir}" if File.exist? dir }

    it "copies the full template to the folder" do
      expect{ subject.run %W[init #{dir}] }.to output_fixture('cli/init/full')
    end

    context "with --minimal" do
      it "copies the minimal template to the folder" do
        expect{ subject.run %W[init #{dir} --minimal] }.to output_fixture('cli/init/minimal')
      end
    end

    context "when the folder already exists" do
      before { FileUtils.touch dir }

      it "raises an error" do 
        expect{ subject.run %W[init #{dir}] }.to raise_error(ArgumentError)
      end
    end
  end
end
