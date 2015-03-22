class WordCounter
  def top_3_words(text)
    return [] unless text =~ /[a-zA-Z]/
    text = text.gsub('.', '').gsub(',', '').gsub(':', '').gsub('/', '')
    text.downcase!
    words = text.split ' '
    word_count = {}
    words.each do |word|
      if word_count.keys.include?(word)
        word_count[word] += 1
      else
        word_count[word] = 1
      end
    end
    result = word_count.sort_by {|_key, value| value}.reverse
    result.map! {|key_value| key_value.first}
    result.first 3
  end
end
