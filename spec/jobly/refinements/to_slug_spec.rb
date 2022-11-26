require 'spec_helper'

describe ToSlug do
  using described_class

  subject { '  Please::Convert me 2 a slug  --' }

  it 'converts a string to a slug kebab' do
    expect(subject.to_slug).to eq 'please-convert-me-2-a-slug'
  end
end
