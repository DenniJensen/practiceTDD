class PinObserver
  PINS = {
    '1' => %w{1 2 4},
    '2' => %w{1 2 3 5},
    '3' => %w{2 3 6},
    '4' => %w{1 4 5 7},
    '5' => %w{2 4 5 6 8},
    '6' => %w{3 5 6 9},
    '7' => %w{4 7 8},
    '8' => %w{5 7 8 9 0},
    '9' => %w{6 8 9},
    '0' => %w{8}
  }
  def get_pins(observed)
    result = observed.chars.map {|pin| PINS[pin]}
    return result.flatten if result.size == 1
    result = result.first.product(result.last).map do |pair|
      pair.join
    end
    result
  end
end
