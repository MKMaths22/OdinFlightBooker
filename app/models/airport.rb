class Airport < ApplicationRecord
  has_many :departing_flights, foreign_key: 'departure_airport_id', dependent: :destroy
  has_many :arriving_flights, foreign_key: 'arrival_airport_id', dependent: :destroy
  validates :code, presence: true
  validates :code, uniqueness: true
end
