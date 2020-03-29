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
monthnames = ['Januar', 'Februar','März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember']
headers = []


# Gets the header of the month, e.g. 'Was mache ich im Januar im Garten?'
# with the help of monthnames, since it just gets those classes where monthname is included
htmldoc.search('.paragraph-field-subheadline').each do |headerOfMonth|
    headerOfMonth = headerOfMonth.text
    # check if months are included in the text
    monthnames.any? do |month|
        (headerOfMonth.include? month) ? (headers.push(headerOfMonth)) : nil
    end
end

month_paragraphs = ['Im Januar ruht der Garten zwar noch größtenteils, ein paar Dinge sind aber dennoch schon zu tun. Im Obst- und Gemüsegarten stehen im Januar Gartenarbeiten wie Obstbaumschnitt auf dem Plan und die ersten Gemüsesorten können vorgezogen werden. Hier finden Sie weitere Gartentipps für den Nutzgarten im Januar. Aber auch im Ziergarten stehen im Januar die ersten Pflegearbeiten auf der To-do-Liste. Hier finden Sie weitere Gartentipps für den Ziergarten im Januar.', 'Im Februar werden im Nutzgarten Beete vorbereitet, Gemüse ausgesät oder Kartoffeln vorgekeimt. Hier finden Sie weitere Gartentipps für den Februar im Nutzgarten. Aber auch Ziergärtner haben im Februar schon Einiges zu tun: Der Kompost muss gesiebt, sommerblühende Sträucher geschnitten und Ziergräser gestutzt werden. Hier finden Sie weitere Gartentipps für den Februar im Ziergarten.', 'Im März startet die Gartensaison und es darf endlich wieder fleißig gewerkelt werden. Im Gemüsegarten werden Salate gepflanzt, Kräuter gestutzt und die ersten Tomaten vorgezogen. Hier finden Sie weitere Gartentipps für den Nutzgarten im März. Im Ziergarten ist es dagegen Zeit für den Rückschnitt verschiedener Sträucher, Stauden und Gehölze. Hier finden Sie weitere Gartentipps für den Ziergarten im März.', 'Vor allem im Obst-und Gemüsegarten ist im April sehr viel zu tun. Ob Obstgehölze düngen, Kartoffeln pflanzen oder Tomaten pikieren – in unseren Gartentipps für den Nutzgarten im April haben wir alle wichtigen Gartenarbeiten aufgelistet, die in diesem Monat anstehen. Im Ziergarten sollten Sie jetzt Frühjahrsblüher auslichten und Dahlien vortreiben. Hier finden Sie weitere Gartentipps für den Ziergarten im April.', 'Im Mai können Gemüsegärtner bereits die ersten Jungpflanzen an die frische Luft setzen. Außerdem sollten die Gemüsebeete gehackt werden, damit das erste Gemüse draußen ausgesät werden kann. Hier finden Sie weitere Gartentipps für den Nutzgarten im Mai. Wer will, kann den Mai nutzen, um im Ziergarten eine Blumenwiese anzulegen oder Beetlücken mit neuen Pflanzen zu füllen. Hier finden Sie weitere Gartentipps für den Ziergarten im Mai.', 'Im Juni können bereits die ersten Tomaten ausgegeizt werden. Außerdem bietet sich dieser Monat an, um Pflanzenjauchen herzustellen. Hier finden Sie weitere Gartentipps für den Nutzgarten im Juni. Im Ziergarten kann in diesem Monat neu gesäter Rasen zum ersten Mal gemäht und Ziersträucher durch Stecklinge vermehrt werden. Außerdem werden jetzt Zweijährige ausgesät. Hier finden Sie weitere Gartentipps für den Ziergarten im Juni.', 'Nutzgärtner sind im Juli voll ausgelastet: Ob Ernte, Aussaat oder Pflege – im Juni stehen im Obst- und Gemüsegarten viele Gartenarbeiten an. Hier finden Sie unsere ausführlichen Gartentipps für den Nutzgarten im Juli. Im Ziergarten steht im Juli vor allem die Bewässerung im Vordergrund, denn dank der immer heißeren Sommer reicht der Niederschlag meist längst nicht mehr aus. Hier finden Sie weitere Gartentipps für den Ziergarten im Juli.', 'Eifrige Gemüsegärtner wissen: Im August ist für viele Gemüsesorten wie Mangold und Endivien der letzte Aussaat- und Pflanztermin. Hier finden Sie weitere Gartentipps für den Nutzgarten im August. Im Ziergarten können dagegen Hortensien gedüngt und Madonnen-Lilien gepflanzt werden. Hier finden Sie weitere Gartentipps für den Ziergarten im August.', 'Der Hochsommer ist vorbei, doch die Gartenarbeit wird deshalb nicht weniger. Obst- und Gemüsegärtner sollten jetzt Leimringe anbringen, um Obstbäume vor dem Frostspanner zu schützen. Hier finden Sie weitere Gartentipps für den Nutzgarten im September.', 'Der goldene Oktober hält für Obst- und Gemüsegärtner eine lange Liste voller Gartenarbeiten bereit. Allem voran steht natürlich die Ernte. Was es sonst noch zu tun gibt, finden Sie in unseren Gartentipps für den Nutzgarten im Oktober. Für Ziergärtner ist der Oktober der optimale Zeitpunkt, um Blumenzwiebeln zu stecken, kahle Stellen im Rasen zu erneuern und Rosen zu pflanzen. Hier finden Sie weitere Gartentipps für den Ziergarten im Oktober.', 'Wer einen Obst- und Gemüsegarten hat, der weiß: Auch wenn die Gartensaison langsam zu Ende geht, gibt es in einem Obst- und Gemüsegarten immer noch genug zu tun. Junge Obstbäume werden vor Frost geschützt, Sträucher wie der Holunder ausgelichtet und die Gemüsebeete abgeräumt. Was es sonst noch zu tun gibt, finden Sie in unseren Gartentipps für den Nutzgarten im November. Außerdem ist es an der Zeit, an unsere kleinen, stachligen Gartenbewohner zu denken. Im Ziergarten sollten Sie Igeln ein kuschliges Winterquartier anbieten. Hier finden Sie weitere Gartentipps für den Ziergarten im November.', 'Im Dezember steht der Winterschutz ganz oben auf der To-do-Liste. Im Obst- und Gemüsegarten können Sie außerdem schon einige Vorbereitungen für das nächste Gartenjahr treffen. Hier finden Sie weitere Gartentipps für den Nutzgarten im Dezember. Im Ziergarten werden jetzt zudem Blütensträucher durch Steckhölzer vermehrt. Hier finden Sie weitere Gartentipps für den Ziergarten im Dezember.']

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
