class Journey < ApplicationRecord

  INTERESTS = ["Culture", "Classical studies", "Cooking", "Critical theory", "Hobbies", "Literature", "Arts", "Fiction", "Game", "Poetry", "Sports", "Performing arts", "Dance", "Film", "Music", "Opera", "Theatre", "Visual arts", "Architecture", "Crafts", "Drawing", "Film", "Painting", "Photography", "Sculpture", "Typography", "Health", "Exercise", "Health science", "Nutrition", "History", "Classical antiquity", "Medieval history", "Renaissance", "Modern history", "Contemporary history", "Feminism", "Communism", "Liberalism", "LGBTQ", "Food", "Tradition", "Fashion", "Aerospace", "Artificial intelligence", "Agriculture", "Big Science", "Computer Science", "Transport", "Robotics", "Military", "Internet culture", "Memes & social network trends", "Biology", "Animals", "Botany", "Ecology", "Famous people", "Frienship", "Romance", "Sex", "Family", "Children", "Philosophy", "Religion", "Archaeology", "Critical theory", "Economics", "Law", "Political science", "Psychology", "Sociology", "Community", "Finance", "Education"]
  POPULARITY = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  validates :title, uniqueness: true, length: { minimum: 6 }, presence: true
  validates :address, presence: true, length: { minimum: 10 }
  validates :duration, presence: true
  validates :price, presence: true
  validates :interest, presence: true, inclusion: { in: INTERESTS }
  validates :sense, presence: true, inclusion: { in: SENSES }
  validates :environment, inclusion: { in: ENVIRONMENTS }
  validates :popularity, inclusion: { in: POPULARITY }

  has_many :users
  belongs_to :booking
end
