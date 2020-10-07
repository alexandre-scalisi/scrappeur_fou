require_relative '../lib/mairie_christmas'

describe 'the get_townhall_email method' do
  it 'Should return a non empty hash' do
    expect(get_townhall_email('https://www.annuaire-des-mairies.com/95/vaudherland.html')).not_to be_empty
  end
end

describe 'the get_townhall_urls method' do
  it 'Should return a non empty array' do
    expect(get_townhall_urls).not_to be_empty
  end
end

describe 'the get_townhall_emails method' do
  it 'Should return an array containing a non empty hash' do
    expect(get_townhalls_emails[0]).not_to be_empty
  end
end
