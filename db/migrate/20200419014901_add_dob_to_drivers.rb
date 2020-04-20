class AddDobToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :dob, :date
  end
end
