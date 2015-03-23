require './morse_code_decoder'

describe MorseCodeDecoder do
  let(:decoder) { MorseCodeDecoder.new }

  describe '.decode_morse' do
    it 'returns human readable text' do
      expect(decoder.decode_morse(morse)).to eq 'HEY JUDE'
    end
  end
end
