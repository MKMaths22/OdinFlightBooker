# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
    
    Flight.delete_all
    Airport.delete_all

    ["KYN", "LBA", "LHR", "LTN"].each do |code|
      Airport.create!(code: code)
    end

    Flight.create!(departure_airport: Airport.find_by(code: 'KYN'), arrival_airport: Airport.find_by(code: 'LBA'), start: DateTime.new(2024, 1, 28, 9, 0, 0), duration_hours: 2, duration_minutes: 20)
    Flight.create!(departure_airport: Airport.find_by(code: 'KYN'), arrival_airport: Airport.find_by(code: 'LHR'), start: DateTime.new(2024, 1, 29, 10, 20, 0), duration_hours: 1, duration_minutes: 10)
    Flight.create!(departure_airport: Airport.find_by(code: 'KYN'), arrival_airport: Airport.find_by(code: 'LTN'), start: DateTime.new(2024, 1, 30, 13, 0, 0), duration_hours: 1, duration_minutes: 00)
    Flight.create!(departure_airport: Airport.find_by(code: 'LBA'), arrival_airport: Airport.find_by(code: 'KYN'), start: DateTime.new(2024, 1, 28, 9, 30, 0), duration_hours: 2, duration_minutes: 20)
    Flight.create!(departure_airport: Airport.find_by(code: 'LBA'), arrival_airport: Airport.find_by(code: 'LHR'), start: DateTime.new(2024, 1, 29, 9, 50, 0), duration_hours: 2, duration_minutes: 30)
    Flight.create!(departure_airport: Airport.find_by(code: 'LHR'), arrival_airport: Airport.find_by(code: 'LBA'), start: DateTime.new(2024, 1, 31, 12, 0, 0), duration_hours: 2, duration_minutes: 30)
    Flight.create!(departure_airport: Airport.find_by(code: 'LHR'), arrival_airport: Airport.find_by(code: 'KYN'), start: DateTime.new(2024, 1, 28, 13, 0, 0), duration_hours: 1, duration_minutes: 10)
    Flight.create!(departure_airport: Airport.find_by(code: 'LHR'), arrival_airport: Airport.find_by(code: 'LTN'), start: DateTime.new(2024, 1, 29, 15, 0, 0), duration_hours: 1, duration_minutes: 10)
    Flight.create!(departure_airport: Airport.find_by(code: 'LTN'), arrival_airport: Airport.find_by(code: 'LHR'), start: DateTime.new(2024, 1, 30, 11, 10, 0), duration_hours: 1, duration_minutes: 10)
    Flight.create!(departure_airport: Airport.find_by(code: 'LTN'), arrival_airport: Airport.find_by(code: 'KYN'), start: DateTime.new(2024, 1, 31, 12, 30, 0), duration_hours: 1, duration_minutes: 00)