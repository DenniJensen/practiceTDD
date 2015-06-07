class PinObserver
  PINS = {
    '1' => %w{1 2 4},
    '2' => %w{1 2 3 5},
    '3' => %w{2 3 6},
    '4' => %w{1 4 5 7},
    '5' => %w{2 4 5 6 8},
    '6' => %w{3 5 6 9},
    '7' => %w{4 7 8},
    '8' => %w{0 5 7 8 9},
    '9' => %w{6 8 9},
    '0' => %w{0 8}
  }

  def get_pins(observed)
    return PINS[observed] if observed.size == 1
    pins = observed.chars
    result = PINS[pins.first]
    pins.delete_at(0)
    pins.each do |pin|
     result = result.product(PINS[pin]).map {|x| x.join}
    end
    result.sort
  end
end
