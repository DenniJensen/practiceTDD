require 'spec_helper'
require_relative '../lib/round_robin'

shared_examples 'round_robin' do
  let(:result) { round_robin(players) }

  it 'returns the expected rounds' do
    expect(result.size).to eq(expected_rounds)
  end

  it 'has no duplicated players' do
    result.each do |key, value|
      expect(value.flatten.uniq).to eq(value.flatten)
    end
  end

  it 'has no duplicated match through the rounds' do
    temp = []
    result.each do |key, value|
      expect(value.flatten).not_to eq(temp)
      temp = value.flatten
    end
  end

  it 'contains all players each rounds' do
    result.each do |key, value|
      expect(value.flatten.count).to eq(player_count_each_round)
    end
  end
end

describe 'odd competitors' do
  let(:players) { %w{name1 name2 name3} }
  let(:expected_rounds) { players.count }
  let(:player_count_each_round) { players.count - 1 }

  it_behaves_like 'round_robin'
end

describe 'even competitors' do
  let(:players) { %w{name1 name2 name3 name4} }
  let(:expected_rounds) { players.count - 1 }
  let(:player_count_each_round) { players.count }

  it_behaves_like 'round_robin'
end
