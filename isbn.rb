
def validate_isbn(isbn)
  digits = isbn.chars
  checksum = digits.delete_at(-1).to_i
  checksum == isbn_checksum(digits.join(''))
end

def isbn_checksum(isbn)
  digits = isbn.gsub(/\D/, '').chars.map(&:to_i)
  multiplied_digits = digits.map.with_index do |d, i|
    position = i + 1
    position.even? ? d * 3 : d
  end
  multiplied_digits.reduce(:+) % 10
end
