class ChangeAcceptedInRides < ActiveRecord::Migration[6.0]
  def change
    change_column :rides, :accepted, :boolean, :default => false
    change_column :rides, :completed, :boolean, :default => false
  end
end
