class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.text :origin
      t.text :destination
      t.references :rider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
