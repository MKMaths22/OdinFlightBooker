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
    @booking.update_attribute(:flight_id, params[:flight_id])
    @booking.save
    @passenger_hash = Hash.new()
    params[:number_of_passengers].to_i.times do |i|
    @passenger_hash[i] = Passenger.create([passengers_attributes[i]])
    end
  end

  def show
  end
end
