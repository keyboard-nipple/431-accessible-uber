class AddRatedToRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :driver_rated, :boolean
    add_column :rides, :rider_rated, :boolean
  end
end
