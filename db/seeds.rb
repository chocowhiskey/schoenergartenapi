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

puts 'Destroying all Months...'

Month.destroy_all

htmlfile = open(url).read
htmldoc = Nokogiri::HTML(htmlfile)
# Februar and Dezember are separately pushed bc the structure of page is a pain in the ass
monthnames = ['Januar', 'Februar','März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember']
headers = []
month_paragraphs = []
# Gets the header of the month, e.g. 'Was mache ich im Januar im Garten?'
# with the help of monthnames, since it just gets those classes where monthname is included
htmldoc.search('.paragraph-field-subheadline').each do |headerOfMonth|
    headerOfMonth = headerOfMonth.text
    # check if months are included in the text
    monthnames.any? do |month|
        (headerOfMonth.include? month) ? (headers.push(headerOfMonth)) : nil
    end
end


# Gets the description of the month
htmldoc.search('.paragraph--type--text-subheadline p').each do |para|
    para = para.text
    # check if months are included in the text
    monthnames.any? do |month|
        (para.include? month) ? (month_paragraphs.push(para)) : nil
    end
end

# Gets ass description of december
htmldoc.search('.paragraph--type--text p').each do |december|
    december = december.text
    (december.include? 'Dezember') ? (month_paragraphs.push(december)) : (nil)
end 

# Gets ass description of february
string = ''
htmldoc.search('.paragraph--type--text-subheadline p').each do |februar|
    februar = februar.text
    # puts februar
    if februar.include? 'Februar'
        string = string + februar 
        month_paragraphs.push(string)
    end
end




=begin
puts "Creating Months and their description"
# Creating new months
headers.zip(month_paragraphs).each do |title_month, description_month|
    m = Month.new(
        title: title_month,
        description: description_month
    )
    m.save!
end 
puts "Created #{Month.count} Months! Have fun planning and being reminded!"
=end