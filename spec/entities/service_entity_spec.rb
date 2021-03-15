# frozen_string_literal: true

RSpec.describe ServiceEntity do
  let(:item) { described_class.new(name: 'Test Name') }

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
    expect(item.as_json['@type']).to eq 'Service'
  end

  it 'should have @context' do
    expect(item.as_json).to have_key '@context'
    expect(item.as_json['@context']).to be_present
    expect(item.as_json['@context']).to include 'schema.org'
  end

  context 'with review' do
    let(:item) { described_class.new(name: 'Test', review: { author: 'test', reviewRating: { ratingValue: 4 } }) }

    it 'should have review' do
      expect(item.as_json).to have_key 'review'
      expect(item.as_json['review']).to be_present
      expect(item.as_json.dig('review', 'author')).to eq 'test'
      expect(item.as_json.dig('review', 'reviewRating', 'ratingValue')).to eq 4
    end
  end

  context 'with reviews' do
    let(:item) do
      described_class.new(
        name: 'Test',
        reviews: [
          { author: 'test1', reviewRating: { ratingValue: 2 } },
          { author: 'test2', reviewRating: { ratingValue: 3 } },
          { author: 'test3', reviewRating: { ratingValue: 4 } }
        ]
      )
    end

    it 'should have review' do
      expect(item.as_json).not_to have_key 'review'
      expect(item.as_json).to have_key 'reviews'
      expect(item.as_json['reviews']).to be_present
      expect(item.as_json['reviews'].size).to eq 3
      expect(item.as_json.dig('reviews', 0, 'author')).to eq 'test1'
      expect(item.as_json.dig('reviews', 0, 'reviewRating', 'ratingValue')).to eq 2
    end
  end
end
