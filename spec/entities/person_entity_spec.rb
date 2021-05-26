# frozen_string_literal: true

RSpec.describe PersonEntity do
  let(:item) { described_class.new(person_name: 'Johan') }

  it 'should be searializable as string' do
    expect(item.to_json).to be_present
  end

  it 'should have @type' do
    expect(item.as_json).to have_key '@type'
    expect(item.as_json['@type']).to be_present
    expect(item.as_json['@type']).to eq 'Person'
  end

  it 'allow to pass single sameAs item' do
    item2 = nil
    expect do
      item2 = described_class.new(person_name: 'Johan', sameAs: 'http://example.com')
    end.not_to raise_error
    expect(item2).to be_present
    expect(item2.as_json).to be_present
    expect(item2.as_json['sameAs']).to eq 'http://example.com'
  end

  it 'allow to pass multiple sameAs links' do
    item2 = nil
    expect do
      item2 = described_class.new(person_name: 'Johan', sameAs: ['http://example.com', 'http://example.com/extra'])
    end.not_to raise_error
    expect(item2).to be_present
    expect(item2.as_json).to be_present
    expect(item2.as_json['sameAs']).to include 'http://example.com'
    expect(item2.as_json['sameAs']).to include 'http://example.com/extra'
  end
end
