class MorseCodeDecoder
  MORSE_CODE = {
    '.-': 'a',
    '-...': 'b',
    '-.-.': 'c',
    '-..': 'd',
    '.': 'e',
    '..-.': 'f',
    '--.': 'g',
    '....': 'h',
    '..': 'i',
    '.---': 'j',
    '-.-': 'k',
    '.-..': 'l',
    '--': 'm',
    '-.': 'n',
    '---': 'o',
    '.--.': 'p',
    '--.-': 'q',
    '.-.': 'r',
    '...': 's',
    '-': 't',
    '..-': 'u',
    '...-': 'v',
    '.--': 'w',
    '-..-': 'x',
    '-.--': 'y',
    '--..':'z'
  }

  def decode_morse(morse)
    result = []
    morse.split('   ').each do |word|
      single_word = ''
      word.split.each do |letter|
        single_word << MORSE_CODE[letter.to_sym]
      end
      result << single_word
    end
    result.join(" ").upcase
  end
end
