# frozen_string_literal: true

RSpec.describe ReviewEntity do
  let(:time) { 1.week.ago }
  let(:item) do
    described_class.new(
      author: 'John',
      description: 'TODO',
      reviewRating: { ratingValue: 3 }
    )
  end

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
    expect(item.as_json['@type']).to eq 'Review'
  end

  it 'should allow set datePublished as datetime' do
    i2 = described_class.new(datePublished: time)
    obj = JSON.parse(i2.to_json)
    newTime = Time.zone.parse(obj['datePublished'])
    expect(newTime).to be_within(1.second).of(time)
  end

  it 'should allow set datePublished as iso8601' do
    i2 = described_class.new(datePublished: time.iso8601)
    obj = JSON.parse(i2.to_json)
    newTime = Time.zone.parse(obj['datePublished'])
    expect(newTime).to be_within(1.second).of(time)
  end
end
