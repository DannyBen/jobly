require 'spec_helper'

describe 'bin/jobly' do
  it "shows list of commands" do
    expect(`bin/jobly`).to match_fixture('cli/commands')
  end

  context "on exception" do
    it "errors gracefuly" do
      output = nil

      Dir.chdir 'spec/fixtures' do
        output = `../../bin/jobly run JobThatErrors`
      end

      expect(output).to match_fixture('cli/exception')
    end
  end
end
