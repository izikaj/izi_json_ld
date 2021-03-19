# frozen_string_literal: true

RSpec.describe FaqPageEntity do
  let(:item) { described_class.new(mainEntity: []) }

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
    expect(item.as_json['@type']).to eq 'FAQPage'
  end

  context 'filled' do
    let(:item) do
      described_class.new(
        mainEntity: [
          { name: 'Question 1', acceptedAnswer: { text: 'Test answer 1' } },
          { name: 'Question 2', acceptedAnswer: { text: 'Test answer 2' } },
          { name: 'Question 3', acceptedAnswer: { text: 'Test answer 3' } }
        ]
      )
    end
    let(:singular) do
      described_class.new(
        mainEntity: {
          name: 'Sing-Question', acceptedAnswer: { text: 'Sing-Answer' }
        }
      )
    end
    let(:shortland) do
      described_class.new(
        mainEntity: [
          { name: 'ShortQuestion', answer: 'ShortAnswer' }
        ]
      )
    end

    it 'should render items' do
      expect(item.as_json).to have_key 'mainEntity'
      expect(item.as_json['mainEntity']).to be_present
      expect(item.as_json['mainEntity'].size).to eq 3
    end

    it 'should render answer properly' do
      answer = item.as_json.dig('mainEntity', 0)
      expect(answer['name']).to eq 'Question 1'
      expect(answer.dig('acceptedAnswer', 'text')).to eq 'Test answer 1'
    end

    it 'should render singular' do
      answer = singular.as_json['mainEntity']
      expect(answer['name']).to eq 'Sing-Question'
      expect(answer.dig('acceptedAnswer', 'text')).to eq 'Sing-Answer'
    end

    it 'should accept name/answer shortland items' do
      answer = shortland.as_json.dig('mainEntity', 0)

      expect(answer).to be_present
      expect(answer['name']).to eq 'ShortQuestion'
      expect(answer.dig('acceptedAnswer', 'text')).to eq 'ShortAnswer'
    end
  end
end
