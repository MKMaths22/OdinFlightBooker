class Booking < ApplicationRecord
  belongs_to :flight, foreign_key: "flight_id"
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers
end
