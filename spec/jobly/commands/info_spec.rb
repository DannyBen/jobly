require 'spec_helper'

describe Commands::InfoCmd do
  subject { CLI.router }

  context "without arguments" do
    context "when the info file exists" do
      before { File.write "spec/fixtures/config/info.md", "# Jobs\n\nmarkdown `supported`" }
      after  { File.unlink "spec/fixtures/config/info.md" }

      it "shows a pretty formatted markdown" do
        expect { subject.run %w[info] }.to output_fixture('cli/info/show')
      end
    end

    context "when the info file does not exist" do
      it "raises InfoFileNotFound" do
        expect { subject.run %w[info] }.to raise_error InfoFileNotFound
      end
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect { subject.run %w[info --help] }.to output_fixture('cli/info/help')
    end
  end
end
