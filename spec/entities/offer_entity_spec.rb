# frozen_string_literal: true

RSpec.describe OfferEntity do
  let(:item) { described_class.new(url: 'http://example.com', price: 9.99) }

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
    expect(item.as_json['@type']).to eq 'Offer'
  end

  it 'should have default currency' do
    expect(item.as_json).to have_key 'priceCurrency'
    expect(item.as_json['priceCurrency']).to be_present
    expect(item.as_json['priceCurrency']).to eq 'USD'
  end

  it 'should have default currency' do
    expect(item.as_json).to have_key 'availability'
    expect(item.as_json['availability']).to be_present
    expect(item.as_json['availability']).to include('OnlineOnly')
  end

  it 'allow to pass coercibles' do
    i2 = nil
    expect do
      i2 = described_class.new(url: 'http://example.com', price: '9.99')
    end.not_to raise_error
    expect(item).to be_present
    expect(item.as_json).to be_present
    expect(item.as_json['price']).to eq 9.99
  end
end
