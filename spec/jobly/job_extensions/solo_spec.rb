require 'spec_helper'

describe JobExtensions::Solo do
  subject { SoloOptionsJob.new }

  context "when using solo without options" do
    subject { SoloJob.new }

    context "when the job is running" do
      it "it is marked as locked and clears the lock on exit" do
        expect{ subject.perform }.to output_fixture('job_extensions/solo-running')
        expect(subject).not_to be_solo_locked
      end
    end

    context "when the job is locked" do
      before { subject.solo_lock }

      it "skips it and clears the lock on exit" do
        expect{ subject.perform }.to output_fixture('job_extensions/solo-skipped')
        expect(subject).not_to be_solo_locked
      end
    end
  end

  context "when using solo with options" do
    it "sets custom redis key" do
      expect(subject.solo_key).to eq "inigo:montoya"
      expect(subject.solo_full_key).to eq "jobly:solo:inigo:montoya"
    end
  end

  describe '#solo_lock' do
    it "sets redis expiration" do
      subject.solo_lock 90.seconds

      Sidekiq.redis do |redis|
        ttl = redis.ttl subject.solo_full_key
        expect(ttl).to be_between(80.seconds, 90.seconds)
      end
    end
  end

end