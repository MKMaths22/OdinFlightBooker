class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @flight_date_options = @flights.map { |f| [f.flight_date] }.uniq
    @airport_options = Airport.all.map { |a| [ a.code, a.id ]}
    if params[:commit]
      @found_flights = Flight.where(departure_airport: Airport.find(allowed_search_params[:departure_airport_id]), arrival_airport: Airport.find(allowed_search_params[:arrival_airport_id]), flight_date:  allowed_search_params[:flight_date])
    else
      @found_flights = []
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end

  private

  def allowed_search_params
    params.permit(:commit, :departure_airport_id, :arrival_airport_id, :flight_date, :number_of_passengers)
  end
end
