class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
  end

  def create
    puts "allowed_params are #{booking_params}"
    @booking = Booking.create!(booking_params)
    puts "Is this being outputted?"
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email])
  end
end
