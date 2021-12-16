# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'faker'

puts 'cleqning DB.....'
Journey.destroy_all
User.destroy_all

puts "seeding"
urls = ['https://images.unsplash.com/photo-1576453336457-64848c4ab6e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2970&q=80', 'https://images.unsplash.com/photo-1615693128203-3b3656d8e852?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80', 'https://images.unsplash.com/photo-1576924593291-95a57fba5c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fG1hcnNlaWxsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60', 'https://www.opera-online.com/media/images/picture/article/0000/0935/5176/xl_opera-de-marseille-saison-2019-2020.jpg?1556291209', 'https://www.pagesjaunes.fr/media/resto/cinema_chambord_OSD07949060-66186.jpeg', 'https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/39/ad/6b.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmjLDgLJd7TxXiwIax_2wcp9oaxcB6T1YD5g&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIx0FY837eYQ9xri3OfTkyZrw8CcD1TaP51g&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYB2ZF26umwuCWQ3_xxKwKpFHK1tZqxh8ZqA&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVfrj2FFxqtNXUS-fhdsg8cQe8xOg9iaOiow&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4_CDhg-dngV53zdSLfVkpVTCPObXnMKQqbg&usqp=CAU', 'https://cdn.radiofrance.fr/s3/cruiser-production/2019/09/c22967bf-191d-457d-83fb-6282f3c34e6f/1136_dscf6283.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhrvTdbplLxoH9rPrbL6A59adnOkNbjx3nrw&usqp=CAU']
u1 = User.create!(email: "fonsecarika@gmail.com", password: "123456789", password_confirmation: "123456789")
u2 = User.create!(email: "sarah@gmail.com", password: "123456789", password_confirmation: "123456789")
u3 = User.create!(email: "illem@gmail.com", password: "123456789", password_confirmation: "123456789")
u4 = User.create!(email: "test@journey.com", password: "123456789", password_confirmation: "123456789")

puts 'created 3 users'

csv_options = { col_sep: '	', quote_char: '"', headers: :first_row }

CSV.foreach(Rails.root.join('lib/lieux_culturels.csv'), csv_options) do |row|
  file = URI.open(urls.sample)

  title = row["Nom du site"]
  interest = row["Categorie"]
  address = row["Adresse 1"] + " " + row["Code Postal"] + " " + row["Ville"]

  journey = Journey.create(title: title,
                  interest: Journey::INTERESTS.sample(rand(1..5)),
                  address: address,
                  user_id: User.all.sample.id,
                  duration: rand(30..300),
                  popularity: rand(1..10),
                  sense: Journey::SENSES.sample,
                  price: rand(1...150),
                  exterior: false,
                  environment: Journey::ENVIRONMENTS.sample,
                  anecdote: Faker::Quote.jack_handey
                )
  journey.photo.attach(io: file, filename: 'file.png', content_type: 'image/png')
  journey.save

 puts 'created 1 journey .....'
 end

 puts ' done seeding ......'
