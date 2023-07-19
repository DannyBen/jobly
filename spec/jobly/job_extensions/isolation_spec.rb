require 'spec_helper'

describe JobExtensions::Isolation do
  context "when the job calls 'isolated'" do
    subject { IsolatedJob }

    it 'runs in a tmp folder' do
      tmpdir_prefix = File.join(Dir.tmpdir, 'jobly-')
      expect { subject.run }.to output(/#{Regexp.escape(tmpdir_prefix)}.+/).to_stdout
    end
  end

  context "when the job does not call 'isolated'" do
    subject { NotIsolatedJob }

    it 'runs in pwd' do
      expect { subject.run }.to output(%r{/jobly$}).to_stdout
    end
  end
end
