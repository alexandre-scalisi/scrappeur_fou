require 'nokogiri'
require 'open-uri'



def get_crypto(doc,i)
  if doc == "" then doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/')) end
   doc.xpath("//*[@id='__next']/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{i + 1}]/td[3]/div").inner_html
end

def get_valeur_crypto(doc,i)
  if doc == "" then doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/')) end
   doc.xpath("//*[@id='__next']/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{i + 1}]/td[5]/a").inner_html
end

def get_number_of_cryptos(doc)
  if doc == "" then doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/')) end
  doc.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr').count
end

def puts_cryptos(doc)
if doc == "" then doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))end
cryptos = []
num_crypto = get_number_of_cryptos(doc)
num_crypto.times do |i|
  nom_crypto = get_crypto(doc,i)
  valeur_crypto = get_valeur_crypto(doc,i)
  cryptos << { nom_crypto => valeur_crypto}
  
end
  return cryptos

end

puts puts_cryptos("")
puts 

