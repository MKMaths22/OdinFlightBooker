class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
  validates :start, presence: true
  validates :duration_hours, presence: true
  validates :duration_minutes, presence: true

  after_create :populate_flight_date

    def flight_date
      start.strftime("%d/%m/%Y")
    end

    def populate_flight_date
      self.update_attribute(:flight_date, self.flight_date)
    end

    def display_flight
      "Departing #{departure_airport.code} at #{start.strftime("%H:%M")} on #{flight_date}. Flight lasts #{duration_hours} hours and #{duration_minutes} minutes before arriving at #{arrival_airport.code}"
    end
end
