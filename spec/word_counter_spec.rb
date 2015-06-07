require 'word_counter'

describe WordCounter do
  let(:word_counter) { WordCounter.new }
  let(:test_string_1) do
    "e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"
  end
  let(:string_with_slash) { " //wont won't won't " }

  context '4 words given' do
    it 'returns the word count' do
      result = ["e", "ddd", "aa"]
      expect(word_counter.top_3_words(test_string_1)).to eq result
    end
  end

  context 'when slash containing' do
    it 'return the word without slash' do
      result = ["won't", "wont"]
      expect(word_counter.top_3_words(string_with_slash)).to eq result
    end
  end

  context 'when only single quote given' do
    it 'return empty string' do
      expect(word_counter.top_3_words("'")).to eq []
    end
  end
end
