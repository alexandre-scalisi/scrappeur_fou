require 'nokogiri'
require 'open-uri'

def get_url()

doc = Nokogiri::HTML(URI.open("https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s"))

end

def scrap_website()
doc = get_url
lignes = []
for ligne in (2..10)
count = doc.xpath("//*[@id='mw-content-text']/div/ul[#{ligne}]/li").count
for index in (1...count+1)
lignes << doc.xpath("//*[@id='mw-content-text']/div/ul[#{ligne}]/li[#{index}]").inner_html

end
end
create_person(lignes)

end

def create_person(lignes)
  
  persons= []
  lignes.each do |b|
  
    person = {}
    person ["first_name"]= b.split("(")[0].split(" ")[0]
    nom = ""
    b.split("(")[0].split(" ")[1..].each{|word| nom << word + " "}
    person ["last name"] = nom.strip
    email_string = ""
    b = b.split("").map { |char| char.ord!=160 ? char : 32.chr }.join

    b.split(" ").each do |a|       
      if !a.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i).nil?
        email_string<<(a + "  ")
      end
    end

    person ["mail"] = email_string =="" ? "none" : email_string.strip
    persons << person
    end

    
    persons
end

