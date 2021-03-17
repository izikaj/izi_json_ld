# frozen_string_literal: true

RSpec.describe BreadcrumbListEntity do
  let(:item) { described_class.new(itemListElement: []) }

  it 'should be searializable as hash' do
    expect(item.as_json).to be_present
  end

  it 'should have @type' do
    expect(item.as_json).to have_key '@type'
    expect(item.as_json['@type']).to be_present
    expect(item.as_json['@type']).to eq 'BreadcrumbList'
  end

  it 'should have @context at root entity' do
    expect(item.as_json).to have_key '@context'
    expect(item.as_json['@context']).to be_present
    expect(item.as_json['@context']).to include 'schema.org'
  end

  context 'with simple item' do
    let(:item) do
      described_class.new(itemListElement: { name: 'Home', position: 0, item: 'https://example.com' })
    end

    it 'should not fail' do
      expect do
        item.dump
        item.as_json
        item.to_json
      end.not_to raise_exception
    end
  end

  context 'with multiple items' do
    let(:item) do
      described_class.new(
        itemListElement: [
          { name: 'Home', position: 0, item: 'https://example.com' },
          { name: 'Blog', position: 1, item: 'https://example.com/blog' },
          { name: 'Post', position: 2, item: 'https://example.com/blog/post' },
        ]
      )
    end

    it 'should not fail' do
      expect do
        item.dump
        item.as_json
        item.to_json
      end.not_to raise_exception
    end
  end
end
