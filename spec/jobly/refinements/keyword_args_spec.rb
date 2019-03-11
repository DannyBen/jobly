require 'spec_helper'

describe KeywordArgs do
  using KeywordArgs

  let(:source) {{
    string:    "works",
    integer:   "3",
    positive:  "true",
    positive2: "yes",
    negative:  "false",
    negative2: "no",
  }}
  
  describe Array do
    subject { source.transform_keys(&:to_s).to_a }

    describe '#to_kwargs' do
      it "converts to a hash with symbol keys" do
        expect(subject.to_kwargs).to eq source
      end
    end
  end

  describe Hash do
    subject { source.transform_keys(&:to_s) }

    describe '#to_kwargs' do
      it "symbolizes keys" do
        expect(subject.to_kwargs).to eq source
      end
    end
  end
end