class AddCodeToAirports < ActiveRecord::Migration[7.1]
  def change
    add_column :airports, :code, :string
  end
end
