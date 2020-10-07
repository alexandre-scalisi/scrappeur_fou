require 'nokogiri'
require 'open-uri'


def get_townhall_email(doc)
  doc = Nokogiri::HTML(URI.open(doc))
  villes_emails = {}
  adresse = doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[1]/td[1]").inner_html
  email = doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").inner_html.gsub(/^.{0}$/,"Inconnue")
  ville = adresse.split( )[3].capitalize
  villes_emails[ville] = email
  villes_emails

end



def get_townhall_urls()
  doc = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com//val-d-oise.html'))
  url = doc.xpath('//*[@class="lientxt"]/@href').text
  url = url.split("./").reject!{|a| a == ""}
  return url
  
end
 
def get_townhalls_emails
  docs = get_townhall_urls
  townhalls_emails = []
   

 docs.each {|doc| townhalls_emails << get_townhall_email("https://www.annuaire-des-mairies.com/#{doc}")}

 townhalls_emails
end

puts get_townhalls_emails
puts