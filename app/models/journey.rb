class Journey < ApplicationRecord
  SENSES = ['Best Sight', "Amazing Hearings", 'Best Tastes', "Amazing Touch", 'Best Smell']
  ENVIRONMENTS = ["Cloudy", "Sunny", "Windy", "calm", "loudy"]
  validates :title, uniqueness: true, length: { minimum: 6 }, presence: true
  validates :address, presence: true, length: { minimum: 10 }
  validates :duration, presence: true
  validates :price, presence: true
  validates :interest, presence: true
  validates :sense, presence: true

  has_many :users
  has_many :bookings
end
