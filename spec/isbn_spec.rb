require_relative '../lib/isbn'

describe '#validate_isbn' do
  it 'returns true for an all-zero ISBN' do
    expect(validate_isbn '0000000000000').to be true
  end

  it 'returns true on valid isbn' do
    valid_isbn = '978059680948' + '5'
    expect(validate_isbn valid_isbn).to be true
  end

  it 'returns true on valid isbn with including dash' do
    invalid_isbn = '978-059680948' + '5'
    expect(validate_isbn invalid_isbn).to be true
  end

  it 'returns false on invalid isbn' do
    invalid_isbn = '978059680948' + '9'
    expect(validate_isbn invalid_isbn).to be false
  end
end

describe '#isbn_checksum' do
  it 'returns 0 for an all-zero ISBN' do
    expect(isbn_checksum '000000000000').to eq 0
  end

  it 'returns the digit sum if all digits are at odd positions' do
    expect(isbn_checksum '102050000010').to eq 9
  end

  it 'returns the digit sum times 3 if all digits are at even positions' do
    expect(isbn_checksum '010000000200').to eq 9
  end

  it 'handles digits in even and odd positions' do
    expect(isbn_checksum '111000000000').to eq 5
  end

  it 'returns the calculated sum modulo 10' do
    expect(isbn_checksum '978059680948').to eq 5
  end

  it 'handles dashes and spaces in ISBN numbers' do
    expect(isbn_checksum '978059680 948').to eq 5
  end
end
