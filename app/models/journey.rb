class Journey < ApplicationRecord

  has_one_attached :photo
  INTERESTS = ["Culture", "Classical studies", "Cooking", "Critical theory", "Hobbies", "Literature", "Arts", "Fiction", "Game", "Poetry", "Sports", "Performing arts", "Dance", "Film", "Music", "Opera", "Theatre", "Visual arts", "Architecture", "Crafts", "Drawing", "Film", "Painting", "Photography", "Sculpture", "Typography", "Health", "Exercise", "Health science", "Nutrition", "History", "Classical antiquity", "Medieval history", "Renaissance", "Modern history", "Contemporary history", "Feminism", "Communism", "Liberalism", "LGBTQ", "Food", "Tradition", "Fashion", "Aerospace", "Artificial intelligence", "Agriculture", "Big Science", "Computer Science", "Transport", "Robotics", "Military", "Internet culture", "Memes & social network trends", "Biology", "Animals", "Botany", "Ecology", "Famous people", "Frienship", "Romance", "Sex", "Family", "Children", "Philosophy", "Religion", "Archaeology", "Critical theory", "Economics", "Law", "Political science", "Psychology", "Sociology", "Community", "Finance", "Education", "Autres lieux de culture", "Bibliotheques", "Cinemas", "Le Dome", "Musees", "Esplanade J4", "Odeon", "Opera", "Salles de spectacle", "Theatres"]
  POPULARITY = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  SENSES = ['Best Sight', "Amazing Hearings", 'Best Tastes', "Amazing Touch", 'Best Smell']
  ENVIRONMENTS = ["Cloudy", "Sunny", "Windy", "Calm", "Loudy"]

  validates :title, uniqueness: true, length: { minimum: 6 }, presence: true
  validates :address, presence: true, length: { minimum: 10 }
  validates :duration, presence: true
  validates :price, presence: true
  acts_as_taggable_on :interests
  validates :sense, presence: true, inclusion: { in: SENSES }
  validates :environment, inclusion: { in: ENVIRONMENTS }
  validates :popularity, inclusion: { in: POPULARITY }

  has_many :users
  has_many :bookings
end
