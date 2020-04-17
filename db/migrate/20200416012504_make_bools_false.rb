class MakeBoolsFalse < ActiveRecord::Migration[6.0]
  def change
    change_column :certifications, :approved, :boolean, :default => false
    change_column :rides, :driver_completed, :boolean, :default => false
    change_column :rides, :rider_completed, :boolean, :default => false
  end
end
