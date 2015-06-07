require 'morse_code_decoder'

describe MorseCodeDecoder do
  let(:decoder) { MorseCodeDecoder.new }

  describe '.decode_morse' do
    context 'sentence given' do
      it 'returns human readable text' do
        morse = '.... . -.--   .--- ..- -.. .'
        expect(decoder.decode_morse(morse)).to eq 'HEY JUDE'
      end
    end

    context 'single word given' do
      it 'returns human readable text' do
        morse = '... --- ...'
        expect(decoder.decode_morse(morse)).to eq 'SOS'
      end
    end

    context 'wrong morse code given' do
      it 'return empty string' do
        morse = '... ---- ...'
        expect(decoder.decode_morse(morse)).to eq ''
      end
    end
  end

  describe '.decode_bits' do
    context 'decoded H given' do
      it 'return morse code' do
        h_as_bits = 11001100110011
        expect(decoder.decode_bits(h_as_bits)).to eq '....'
      end
    end

    context 'decoded SOS given' do
      it 'return morse code' do
        h_as_bits = 110011001100000011111100111111001111110000001100110011
        expect(decoder.decode_bits(h_as_bits)).to eq '... --- ...'
      end
    end

    context 'decoded HEY JUDE given' do
      it 'returns morse code' do
        bits = '110011001100110000001100000011111100110011111100111111'\
        '000000000000001100111111001111110011111100000011001100111111000'\
        '0001111110011001100000011'
        expect(decoder.decode_bits(bits)).to eq '.... . -.--   .--- ..- -.. .'
      end
    end
  end
end
