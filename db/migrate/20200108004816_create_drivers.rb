class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.string :dob
      t.string :license
      t.string :uid

      t.timestamps
    end
  end
end
