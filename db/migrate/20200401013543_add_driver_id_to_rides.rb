class AddDriverIdToRides < ActiveRecord::Migration[6.0]
  def change
    add_reference :rides, :drivers, foreign_key: true
  end
end
 