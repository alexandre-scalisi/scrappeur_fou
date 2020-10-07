require_relative '../lib/cher_depute'

describe 'the get_url method ' do
  it 'should return a non empty string' do
    expect(get_url.to_s.length).to be > 0
  end
end

describe 'the scrap_website method ' do
  it 'should return an array of non empty hashes' do
    expect(scrap_website[0]).not_to be_empty
  end
end
