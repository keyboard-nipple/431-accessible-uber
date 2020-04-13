class AddDateToRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :timeAndDate, :datetime
  end
end
