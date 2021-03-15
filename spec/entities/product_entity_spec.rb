# frozen_string_literal: true

RSpec.describe ProductEntity do
  let(:item) { described_class.new(name: 'Test') }

  it 'should be searializable as hash' do
    expect(item.as_json).to be_present
  end

  it 'should be searializable as string' do
    expect(item.to_json).to be_present
  end

  it 'should return html_safe string' do
    expect(item.to_json).to be_html_safe
  end

  it 'should have @type' do
    expect(item.as_json).to have_key '@type'
    expect(item.as_json['@type']).to be_present
    expect(item.as_json['@type']).to eq 'Product'
  end

  it 'should have @context' do
    expect(item.as_json).to have_key '@context'
    expect(item.as_json['@context']).to be_present
    expect(item.as_json['@context']).to include 'schema.org'
  end

  context 'with aggregateRating' do
    let(:item) { described_class.new(name: 'Test', aggregateRating: { ratingValue: 4 }) }

    it 'should have aggregateRating' do
      expect(item.as_json).to have_key 'aggregateRating'
      expect(item.as_json['aggregateRating']).to be_present
      expect(item.as_json.dig('aggregateRating', 'ratingValue')).to eq 4
    end
  end

  context 'with offers' do
    let(:item) { described_class.new(name: 'Test', offers: { url: 'test', price: 0.9 }) }

    it 'should have offers' do
      expect(item.as_json).to have_key 'offers'
      expect(item.as_json['offers']).to be_present
      expect(item.as_json.dig('offers', 'url')).to eq 'test'
    end
  end
end
