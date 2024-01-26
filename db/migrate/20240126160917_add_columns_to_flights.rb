class AddColumnsToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :duration_hours, :integer
    add_column :flights, :duration_minutes, :integer
    add_column :flights, :start, :datetime
    add_reference :flights, :departure_airport, null: false, foreign_key: { to_table: :airports }
    add_reference :flights, :arrival_airport, null: false, foreign_key: { to_table: :airports }
  end
end
