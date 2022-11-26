require 'spec_helper'

describe 'bin/jobly' do
  it 'shows list of commands' do
    expect(`bin/jobly`).to match_approval('cli/commands')
  end

  context 'when an error occurs' do
    it 'errors gracefully' do
      output = nil

      Dir.chdir 'spec/fixtures' do
        output = `../../bin/jobly run JobThatErrors`
      end

      expect(output).to match_approval('cli/exception')
    end
  end
end
