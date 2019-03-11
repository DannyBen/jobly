require 'spec_helper'

describe JobExtensions::OptionAccessors do
  subject { OptionsJob }

  it "sets options using accessors" do
    expect{ OptionsJob.perform }.to output_fixture('job_extensions/option_accessors')
  end
end