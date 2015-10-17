def solve(map, current_pos, escape_point)
  return [] if map.empty?
  navigation = []
  while map[current_pos['x'] + 1][current_pos['y']]
    navigation << 'right'
    current_pos['x'] += 1;
  end
  while map[current_pos['x']][current_pos['y'] + 1]
    navigation << 'down'
    current_pos['y'] += 1;
  end
  navigation
end
