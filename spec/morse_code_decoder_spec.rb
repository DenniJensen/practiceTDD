require './morse_code_decoder'

describe MorseCodeDecoder do
  let(:decoder) { MorseCodeDecoder.new }

  describe '.decode_bits' do
    it 'returns morse code' do
      bits = '110011001100110000001100000011111100110011111100111111000\
      0000000000011001111110011111100111111000000110011001111110000001111\
      110011001100000011'
      result = '···· · −·−− ·−−− ··− −·· ·'
      expect(decoder.decode_bits(bits)).to eq result
    end
  end

  describe '.decode_morse' do
    it 'returns real sentence' do
      morse = '···· · −·−− ·−−− ··− −·· ·'
      result = 'HEY JUDE'
      expect(decoder.decode_morse(morse)).to eq result
    end
  end
end
