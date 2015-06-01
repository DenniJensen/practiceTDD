
def get_winner(match)
  score_table = {}
  match.uniq.each {|partion|  score_table[partion] = match.count(partion)}
  first = score_table.max_by{|key, value| value }
  return first.first if first[1] > match.count * 0.5
  nil
end
