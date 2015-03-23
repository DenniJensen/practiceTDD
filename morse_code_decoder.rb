class MorseCodeDecoder
  MORSE_CODE = {
    ".-" => "a", "-..." => "b", "-.-." => "c",
    "-.." => "d", "." => "e", "..-." => "f",
    "--." => "g", "...." => "h", ".." => "i",
    ".---" => "j", "-.-" => "k", ".-.." => "l",
    "--" => "m", "-." => "n", "---" => "o",
    ".--." => "p", "--.-" => "q", ".-." => "r",
    "..." => "s", "-" => "t", "..-" => "u",
    "...-" => "v", ".--" => "w", "-..-" => "x",
    "-.--" => "y", "--.." => "z"
  }

  def decode_morse(morse)
    result = []
    morse.split('   ').each do |word|
      single_word = ''
      word.split.each do |letter|
        return '' unless MORSE_CODE[letter]
        single_word << MORSE_CODE[letter]
      end
      result << single_word
    end
    result.join(" ").upcase
  end

  def decode_bits(bits)
    bits = bits.to_s.gsub('000000000000', '   ')
    bits = bits.gsub('111111', '-').gsub('000000', ' ')
    bits.gsub("11", '.').gsub('00', '')
  end
end
