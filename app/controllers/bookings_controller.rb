class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
  end

  def create
    copy_of_params = booking_params
    @booking = Booking.new(booking_params.except(:number_of_fields))

    respond_to do |format|
      if @booking.save
        @booking.passengers.each do |pass|
          PassengerMailer.confirmation_email(pass).deliver_later
        end
        format.html { redirect_to booking_path(id: @booking.id) }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { redirect_to new_booking_path(number_of_passengers: copy_of_params[:number_of_fields], flight_id: @booking.flight.id) }
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
    params.require(:booking).permit(:flight_id, :number_of_fields, passengers_attributes: [ :name, :email])
  end
end
