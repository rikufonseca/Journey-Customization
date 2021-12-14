class Booking < ApplicationRecord
  belongs_to :journey
  belongs_to :user
  validates :status, presence: true
  validates :start_date, presence: true
  validates :number_of_people, presence: true, numericality: { other_than: 0 }

end
