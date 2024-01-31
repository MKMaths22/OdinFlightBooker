class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    passenger_hash = Hash.new()
    params[:number_of_passengers].times do |i|
      passenger_hash[i] = Passenger.new
    end
  end

  def show
  end
end
