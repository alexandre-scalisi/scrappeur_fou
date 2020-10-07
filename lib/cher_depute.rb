require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open("https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s"))

mails = []
for ligne in (2..10)
count = doc.xpath("//*[@id='mw-content-text']/div/ul[#{ligne}]/li").count
lignes = []
for index in (1...count+1)
lignes << doc.xpath("//*[@id='mw-content-text']/div/ul[#{ligne}]/li[#{index}]").inner_html
end


lignes.each do |b|
  
  person = {}
  person ["first_name"]= b.split("(")[0].split(" ")[0]
  nom = ""
  b.split("(")[0].split(" ")[1..].each{|word| nom << word + " "}
  person ["last name"] = nom.strip
  email_string = ""
  b = b.split("").map { |char| if char.ord!=160 then char else 32.chr end }.join
  b.split(" ").each do |a|

     
      
    if a.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
      email_string<<(a + "  ")
    end
  
  end

  
  
  person ["mail"] = email_string =="" ? "none" : email_string.strip
  
  

  p person
end


end