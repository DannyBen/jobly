require 'spec_helper'

describe ArgumentConverters do
  using ArgumentConverters
  
  describe Array do
    subject { ["hello:world", "count:2"] }

    describe '#to_params' do
      it "converts to a hash" do
        expect(subject.to_params).to eq({:count=>"2", :hello=>"world"})
      end
    end
  end
end