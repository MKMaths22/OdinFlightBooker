class Booking < ApplicationRecord
  belongs_to :flight, foreign_key: true
  has_many :passengers
  accepts_nested_attributes_for :passengers
end
