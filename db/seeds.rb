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
urls = ['https://picsum.photos/seed/picsum/200/300']
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
