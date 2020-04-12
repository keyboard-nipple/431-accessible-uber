class AddCompletedToRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :driver_completed, :boolean
    add_column :rides, :rider_completed, :boolean
  end
end
