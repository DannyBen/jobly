require 'spec_helper'

describe ConvertToTyped do
  using ConvertToTyped
  
  describe Array do
    subject { ["123", "hello"] }

    describe '#convert_to_typed' do      
      it "converts to a typed variable wherever possible" do
        expect(subject.convert_to_typed).to eq [123, "hello"]
      end
    end
  end

  describe String do
    subject { "123" }

    describe '#convert_to_typed' do      
      it "converts a typed variable wherever possible" do
        expect(subject.convert_to_typed).to eq 123
      end
    end
  end
end