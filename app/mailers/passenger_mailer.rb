class PassengerMailer < ApplicationMailer
  def confirmation_email
    @passenger = params[:passenger]
    @booking = @passenger.booking
    @flight = @booking.flight
    mail(to: @passenger.email, subject: "Your Booking Confirmation for Flight No. #{@flight.id}")
  end
end
