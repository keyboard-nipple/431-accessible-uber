class RemoveDateFromRides < ActiveRecord::Migration[6.0]
  def change
    remove_column :rides, :timeAndDate
  end
end
