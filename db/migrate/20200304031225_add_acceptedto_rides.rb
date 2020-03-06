class AddAcceptedtoRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :accepted, :boolean
    add_column :rides, :completed, :boolean
  end
end
