require_relative '../phone_number'

describe '#check_phone_numbers' do
 it 'returns true if no numbers are passed' do
   expect(check_phone_numbers []).to be true
 end

 it 'returns false if numbers are equal' do
   expect(check_phone_numbers ['123', '123']).to be false
 end

 it 'returns false if numbers are equals except for different whitespace' do
   expect(check_phone_numbers ['123', '1 23']).to be false
   expect(check_phone_numbers [' 1 23', '1 23 ']).to be false
   expect(check_phone_numbers [' 12 3', '1 2 3']).to be false
 end

 it 'returns true if the numbers have differend prefixes' do
   expect(check_phone_numbers ['123', '223']).to be true
 end

 it 'returns false if one number is the prefix of the other one' do
   expect(check_phone_numbers ['123', '123456']).to be false
   expect(check_phone_numbers ['123456', '123']).to be false
 end
end
