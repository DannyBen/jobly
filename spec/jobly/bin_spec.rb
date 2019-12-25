require 'spec_helper'

describe 'bin/jobly' do
  it "shows list of commands" do
    expect(`bin/jobly`).to match_fixture('cli/commands')
  end

  context "on exception" do
    it "errors gracefuly" do
      Dir.chdir 'spec/fixtures' do
        expect(`../../bin/jobly run JobThatErrors`).to match_fixture('cli/exception')
      end
    end
  end
end
