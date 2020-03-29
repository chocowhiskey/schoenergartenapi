# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

url = 'https://www.mein-schoener-garten.de/gartenpraxis/was-mache-ich-wann-im-garten-6901'

htmlfile = open(url).read
htmldoc = Nokogiri::HTML(htmlfile)
monthnames = ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember']

# Gets the header of the month, e.g. 'Was mache ich im Januar im Garten?'
# with the help of monthnames, since it just gets those classes where monthname is included
htmldoc.search('.paragraph-field-subheadline').each do |element|
    puts element.text
end