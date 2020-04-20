class ChangeDobInRiders < ActiveRecord::Migration[6.0]
  def change
    remove_column :riders, :dob
  end
end
