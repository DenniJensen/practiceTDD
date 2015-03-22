require './word_counter'

describe WordCounter do
  let(:word_counter) { WordCounter.new }
  let(:test_string_1) do
    "e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"
  end

  context '4 words given' do
    it 'returns the word count' do
      result = ["e", "ddd", "aa"]
      expect(word_counter.top_3_words(test_string_1)).to eq result
    end
  end
end
