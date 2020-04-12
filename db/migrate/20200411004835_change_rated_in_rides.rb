class ChangeRatedInRides < ActiveRecord::Migration[6.0]
  def change
    change_column :rides, :driver_rated, :boolean, :default => false
    change_column :rides, :rider_rated, :boolean, :default => false
  end
end
