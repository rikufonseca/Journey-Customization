class User < ApplicationRecord
  has_many :bookings
  validates :full_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :journeys
end
