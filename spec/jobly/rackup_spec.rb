require 'spec_helper'

describe 'config.ru' do
  subject { load 'lib/jobly/config.ru' }

  it "works" do
    expect{ subject }.to output_fixture('rackup/default')
  end

  context "when there is a Jobly.mount config" do
    let(:mounts) { { "/me" => "MeApp", "/myself" => "MyselfAPp" } }

    before { Jobly.mounts = mounts }
    after  { Jobly.mounts = nil }

    it "mounts the additional rack apps" do
      expect{ subject }.to output_fixture('rackup/mounts')
    end
  end
end