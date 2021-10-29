# frozen_string_literal: true

RSpec.describe ReviewEntity do
  let(:time) { 1.week.ago }
  let(:item_data) do
    {
      author: 'John',
      description: 'TODO',
      reviewRating: { ratingValue: 3 }
    }
  end
  let(:item) { described_class.new(item_data) }

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

  context 'datePublished' do
    it 'should allow set datePublished as datetime' do
      i2 = described_class.new(datePublished: time)
      obj = JSON.parse(i2.to_json)

      new_time = Time.zone.parse(obj['datePublished'])
      expect(new_time).to be_within(1.second).of(time)
    end

    it 'should allow set datePublished as iso8601' do
      i2 = described_class.new(datePublished: time.iso8601)
      obj = JSON.parse(i2.to_json)

      new_time = Time.zone.parse(obj['datePublished'])
      expect(new_time).to be_within(1.second).of(time)
    end
  end

  context 'author' do
    it 'should parse author name as person' do
      author = item.as_json['author']
      expect(author).to be_a Hash
      expect(author['@type']).to eq 'Person'
      expect(author['name']).to eq item.author
    end

    it 'should allow to pass author hash' do
      raw = described_class.new(item_data.merge(author: { person_name: 'Kenny' }))
      author = raw.as_json['author']
      expect(author).to be_a Hash
      expect(author['@type']).to eq 'Person'
      expect(author['name']).to eq raw.author.name
    end

    it 'should allow to pass author hash (Organization)' do
      raw = described_class.new(item_data.merge(author: { name: 'Kenny' }))
      author = raw.as_json['author']
      expect(author).to be_a Hash
      expect(author['@type']).to eq 'Organization'
      expect(author['name']).to eq raw.author.name
    end
  end
end
