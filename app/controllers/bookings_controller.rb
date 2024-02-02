class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @passenger_hash = Hash.new()
    params[:number_of_passengers].to_i.times do |i|
    @passenger_hash[i] = Passenger.new
    end
  end

  def create
    @booking = Booking.new
    number_of_passengers = params[:booking][:number_of_passengers]
    puts "number of passengers = #{number_of_passengers}"
    3.times do |i|
    puts "The value of i is #{i}"
    @passenger_hash[i] = Passenger.create([passengers_attributes[i]])
    puts "passenger_hash is #{@passenger_hash}"
    end
    @booking.update_attribute(:flight_id, params[:flight_id])
    @booking.save
    redirect_to root_path
  end

  def show
  end
end
