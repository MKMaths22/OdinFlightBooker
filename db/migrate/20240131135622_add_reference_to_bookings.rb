class AddReferenceToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :flight, foreign_key: true
  end
end
