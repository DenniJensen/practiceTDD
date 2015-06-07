require 'mine_escape'

describe '#solve' do
  it { expect(solve([], { x: 0, y: 0 }, { x: 0, y: 0 })).to eq [] }

  context '3x3 matrix given' do
    let(:empty_map) { Array.new(3, Array.new(3, false)) }
    let(:map) do
      [
        [true, true, true],
        [false, false, true],
        [true, true, true]
      ]
    end

    it 'returns [] with false only' do
      current_pos = { x: 0 , y: 0}
      exit_pos = { x: 0 , y: 0}
      expect(solve(map, current_pos, exit_pos)).to eq []
    end

    it 'return array of rights to goal' do
      current_pos = { x: 0 , y: 0}
      exit_pos = { x: 2 , y: 0}
      expect(solve(map, current_pos, exit_pos)).to eq(%w{right right right})
    end
  end
end
