require 'spec_helper'

describe CLI do
  describe '::router' do
    it 'returns a MisterBin::Runner instance' do
      expect(described_class.router).to be_a MisterBin::Runner
    end
  end
end
