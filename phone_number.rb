
def check_phone_numbers numbers
  normalized_numbers = numbers.map() {|x| x.gsub ' ', ''}
  return false if normalized_numbers != normalized_numbers.uniq
  normalized_numbers.all? do |n|
    others = normalized_numbers - [n]
    !n.start_with?(*others)
  end
end



