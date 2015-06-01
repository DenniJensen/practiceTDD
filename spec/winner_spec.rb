require './winner'

describe '#get_winner' do
  let(:match_1) { ['A', 'A', 'B'] }
  let(:match_2) { ['A', 'A', 'B', 'B'] }
  let(:match_3) { ['A', 'A', 'B', 'B', 'B'] }

  it 'detects the winner' do
    expect(get_winner(match_1)).to eq 'A'
    expect(get_winner(match_3)).to eq 'B'
  end

  it 'cannot detect a winner on even result' do
    expect(get_winner(match_2)).to eq nil
  end
end
