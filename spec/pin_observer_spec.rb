require_relative '../pin_observer'

describe PinObserver do
  let(:obs) { PinObserver.new }

  context 'when 1 pin given' do
    it 'returns the right pins' do
      expect(obs.get_pins('1')).to eq %w{1 2 4}
    end
  end

  context 'when 2 pins given' do
    it 'returns the right pins' do
      expect(obs.get_pins('11')).to eq %w{11 12 14 21 22 24 41 42 44}
      expect(obs.get_pins('39')).to eq %w{26 28 29 36 38 39 66 68 69}
    end
  end
end

