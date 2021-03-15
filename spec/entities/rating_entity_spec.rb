# frozen_string_literal: true

RSpec.describe RatingEntity do
  let(:item) { described_class.new(ratingValue: 4) }

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
    expect(item.as_json['@type']).to eq 'Rating'
  end

  [
    ['bestRating', 5],
    ['worstRating', 1]
  ].each do |(field, value)|
    it "should have default #{field}" do
      expect(item.as_json).to have_key field
      expect(item.as_json[field]).to be_present
      expect(item.as_json[field]).to eq value
    end
  end
end
