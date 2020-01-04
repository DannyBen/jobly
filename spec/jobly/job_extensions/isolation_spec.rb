require 'spec_helper'

describe JobExtensions::Isolation do
  subject { IsolatedJob }

  it "makes the job run in a tmp folder" do
    expect{ subject.run }.to output(%r{/tmp/jobly-.+}).to_stdout
  end

end
