class AddFlightDateToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :flight_date, :string
  end
end
