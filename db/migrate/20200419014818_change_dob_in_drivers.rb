class ChangeDobInDrivers < ActiveRecord::Migration[6.0]
  def change
    remove_column :drivers, :dob
  end
end
