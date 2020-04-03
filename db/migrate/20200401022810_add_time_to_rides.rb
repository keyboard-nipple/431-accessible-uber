class AddTimeToRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :timeAndDate, :text
  end
end
