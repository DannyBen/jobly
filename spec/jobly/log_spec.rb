require 'spec_helper'

describe Log do
  subject { described_class.new }

  describe '::new' do
    context "with an empty target" do
      it "returns an STDOUT Logger" do
        expect(subject.instance_variable_get(:@logdev).dev.inspect)
          .to eq "#<IO:<STDOUT>>"
      end      
    end

    context "with :stdout" do
      subject { described_class.new :stdout }

      it "returns an STDOUT Logger" do
        expect(subject.instance_variable_get(:@logdev).dev.inspect)
          .to eq "#<IO:<STDOUT>>"
      end      
    end

    context "with a filename" do
      subject { described_class.new 'spec/tmp/log.log' }

      it "returns a file Logger" do
        expect(subject.instance_variable_get(:@logdev).dev.inspect)
          .to eq "#<File:spec/tmp/log.log>"
      end
    end

    context "with a syslog connection string" do
      subject { described_class.new 'syslog://host:prog@1.2.3.4:123' }

      it "returns a syslog Logger" do
        expect(subject.instance_variable_get(:@logdev).dev)
          .to be_a RemoteSyslogLogger::UdpSender
      end

      it "properly configures the syslog logger" do
        logdev = subject.instance_variable_get(:@logdev).dev
        packet = logdev.instance_variable_get :@packet
        expect(logdev.instance_variable_get :@remote_hostname).to eq "1.2.3.4"
        expect(logdev.instance_variable_get :@remote_port).to eq 123
        expect(packet.hostname).to eq "host"
        expect(packet.tag).to eq "prog"        
      end      
    end
  end
end