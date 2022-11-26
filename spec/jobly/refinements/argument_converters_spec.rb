require 'spec_helper'

describe ArgumentConverters do
  using described_class

  describe Array do
    subject { ['hello:world', 'count:2'] }

    describe '#to_params' do
      it 'converts to a hash' do
        expect(subject.to_params).to eq({ count: '2', hello: 'world' })
      end

      context 'when the value also includes a colon' do
        subject { ['message:everybody say: jump!', 'time:18:30'] }

        it 'still converts to a hash' do
          expect(subject.to_params).to eq({ time: '18:30', message: 'everybody say: jump!' })
        end
      end
    end
  end
end
