def round_robin(array_of_players)
  array_of_players = array_of_players + [nil] if array_of_players.size.odd?
  half_size = array_of_players.size / 2
  first_half = array_of_players.slice(0, half_size)
  secound_half = array_of_players.slice(half_size, array_of_players.size)

  matches = {}
  rounds = array_of_players.size - 1
  rounds.times do |n|
    current_round = []
    first_half.each_with_index do |player, index|
      if (player && secound_half[index])
        current_round << [player, secound_half[index]]
      end
    end
    matches["round_#{n + 1}"] = current_round
    secound_half << first_half.pop
    first_half.insert(1, secound_half.shift)
  end
  matches
end
