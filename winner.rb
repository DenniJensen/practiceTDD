
def get_winner(match)
  partions = match.uniq
  score_table = Hash.new(0)
  partions.each {|partion|  score_table[partion] = match.count(partion)}
  p score_table
  p score_table.max_by{|key, value| value }
  score_table.max_by{|key, value| value }.first
end
