class CreateCertifications < ActiveRecord::Migration[6.0]
  def change
    create_table :certifications do |t|
      t.string :name
      t.boolean :approved
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
