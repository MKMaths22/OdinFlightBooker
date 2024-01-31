class AddEmailToPassengers < ActiveRecord::Migration[7.1]
  def change
    add_column :passengers, :email, :string
  end
end
