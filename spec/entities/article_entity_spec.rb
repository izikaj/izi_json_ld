# frozen_string_literal: true

RSpec.describe ArticleEntity do
  let(:item) { described_class.new(url: 'http://example.com', price: 9.99) }

  it 'should be searializable as hash' do
    expect(item.as_json).to be_present
  end

  it 'should have @type' do
    expect(item.as_json).to have_key '@type'
    expect(item.as_json['@type']).to be_present
    expect(item.as_json['@type']).to eq 'Article'
  end

  it 'todo' do
    expect(true).to eq false
  end
end
