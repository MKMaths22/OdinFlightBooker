class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|

    t.timestamps
    end
  end
end
