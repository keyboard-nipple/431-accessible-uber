class AddDobToRiders < ActiveRecord::Migration[6.0]
  def change
    add_column :riders, :dob, :date
  end
end
