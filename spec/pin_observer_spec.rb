require 'pin_observer'
require 'pry'

describe PinObserver do
  let(:obs) { PinObserver.new }
  let(:pins_of_1) { %w{1 2 4} }
  let(:pins_of_3) { %w{2 3 6} }
  let(:pins_of_9) { %w{6 8 9} }
  let(:pins_of_11) { %w{11 12 14 21 22 24 41 42 44} }
  let(:pins_of_39) { %w{26 28 29 36 38 39 66 68 69} }

  let(:pins_of_113) do
    result = pins_of_11.product(pins_of_3)
    result.map! { |x| x.join }
  end

  let(:pins_of_1139) do
    result = pins_of_113.product(pins_of_9)
    result.map! { |x| x.join }
  end

  let(:pins_of_11399) do
    result = pins_of_1139.product(pins_of_9)
    result.map! { |x| x.join }
  end

  context 'when 1 pin given' do
    it 'returns the right pins' do
      expect(obs.get_pins('1')).to eq %w{1 2 4}
      expect(obs.get_pins('0')).to eq %w{0 8}
    end
  end

  context 'when 2 pins given' do
    it 'returns the right pins' do
      expect(obs.get_pins('11')).to eq pins_of_11
      expect(obs.get_pins('39')).to eq pins_of_39
    end
  end

  context 'when 3 pins given' do
    it 'returns the right pins' do
      expect(obs.get_pins('113')).to eq pins_of_113
    end
  end

  context 'when 4 pins given' do
    it 'returns the right pins' do
      expect(obs.get_pins('1139')).to eq pins_of_1139
    end
  end

  context 'when more than 4 pins given' do
    it 'returns the right pins' do
      expect(obs.get_pins('11399')).to eq pins_of_11399
    end
  end
end

