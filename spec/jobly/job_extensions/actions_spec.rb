require 'spec_helper'

describe JobExtensions::Actions do
  subject { ActionsJob }

  it "run blocks of code around #perform" do
    expect{ subject.run }.to output_fixture('job_extensions/actions')
  end

  describe "when a job fails" do
    it "still runs after and on_failure" do
      expect{ subject.run fail:true }.to raise_error("RAISED")
        .and output_fixture('job_extensions/actions-failure')
    end
  end

  describe '#skip_job' do
    subject { FilterJob }

    it "avoid running the job and raises JobSkipped" do
      expect{ subject.run }.to output_fixture('job_extensions/actions-skip')
    end
    
  end
end