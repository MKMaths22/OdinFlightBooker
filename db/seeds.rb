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

    Flight.create!(departure_airport: Airport.find_by(code: 'KYN'), arrival_airport: Airport.find_by(code: 'LBA'), start: Time.now, duration_hours: 1, duration_minutes: 30)
