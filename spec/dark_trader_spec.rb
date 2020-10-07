require_relative '../lib/dark_trader'

describe 'the get_crypto method ' do
  it 'Should return a string with a length > 0' do
    expect(get_crypto('', 1).length).to be > 0
  end
end

describe 'the get_valeur_crypto method ' do
  it 'Should return a string with a length > 0' do
    expect(get_valeur_crypto('', 1).length).to be > 0
  end
end

describe 'the get_number_of_cryptos method ' do
  it 'Should return a string with a length > 0' do
    expect(get_number_of_cryptos('')).to be > 0
  end
end

describe 'the puts_cryptos method ' do
  it 'Should return an array containing hashes containing key-value' do
    expect(puts_cryptos('')[0]).not_to be_empty
  end
end
