class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
  validates :start, presence: true
  validates :duration_hours, presence: true
  validates :duration_minutes, presence: true
    def flight_date
      start.strftime("%d/%m/%Y")
    end
end
