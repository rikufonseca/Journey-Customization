class User < ApplicationRecord
  has_many :bookings
  has_many :journeys
  validates :full_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true 
  end 
end
