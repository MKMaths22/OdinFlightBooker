class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        @booking.passengers.each do |pass|
          PassengerMailer.with(passenger: pass).confirmation_email.deliver_later
        end
        format.html { redirect_to booking_path(id: @booking.id) }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { redirect_to new_booking_path() }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
        flash[:alert] = "Booking failed to save. All name/email fields are required. Please try again."
      end
    end 
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email])
  end
end
