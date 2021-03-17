# frozen_string_literal: true

RSpec.describe ArticleEntity do
  let(:item) do
    described_class.new(
      headline: 'Test Article Title',
      mainEntityOfPage: {
        web_page: 'https://exampla.com/blog/page'
      }
    )
  end

  it 'should be searializable as hash' do
    expect(item.as_json).to be_present
  end

  it 'should have @type' do
    expect(item.as_json).to have_key '@type'
    expect(item.as_json['@type']).to be_present
    expect(item.as_json['@type']).to eq 'Article'
  end

  it 'should have @context at root entity' do
    expect(item.as_json).to have_key '@context'
    expect(item.as_json['@context']).to be_present
    expect(item.as_json['@context']).to include 'schema.org'
  end

  it 'possible to set mainEntityOfPage as URL' do
    custom = described_class.new(headline: 'Title', mainEntityOfPage: 'https://exampla.com/blog/page')
    expect(custom.as_json.dig('mainEntityOfPage')).to be_present
    expect(custom.as_json.dig('mainEntityOfPage')).to eq 'https://exampla.com/blog/page'
  end

  context 'filled Article' do
    let(:item) do
      described_class.new(
        mainEntityOfPage: {
          web_page: 'https://exampla.com/blog/page'
        },
        headline: 'Test Article Title',
        description: 'Test Article Description',
        image: 'https://exampla.com/blog/page.png',
        author: { name: 'TestUser' },
        publisher: {
          name: 'TestInc',
          logo: { url: 'https://exampla.com/logo.png' }
        },
        datePublished: 1.week.ago,
        dateModified: 2.days.ago
      )
    end

    it 'should not fail' do
      expect do
        item.dump
        item.as_json
        item.to_json
      end.not_to raise_exception
    end

    [
      ['Publisher name', %w[publisher name], 'TestInc'],
      ['Main Entity id', %w[mainEntityOfPage @id], 'https://exampla.com/blog/page'],
      ['Publisher type', %w[publisher @type], 'Organization'],
      ['Publisher logo type', %w[publisher logo @type], 'ImageObject'],
      ['Publisher logo', %w[publisher logo url], 'https://exampla.com/logo.png'],
      ['Post image', %w[image], 'https://exampla.com/blog/page.png'],
      ['Author name', %w[author name], 'TestUser']
    ].each do |(desc, path, val)|
      it "should render #{desc}[#{path.join('.')}]" do
        expect(item.as_json.dig(*path)).to be_present
        expect(item.as_json.dig(*path)).to eq val
      end
    end
  end
end
