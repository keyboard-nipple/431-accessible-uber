class Dissabilities < ActiveRecord::Migration[6.0]
  def change
    add_column :riders, :blind_accessibility, :boolean
    add_column :riders, :deaf, :boolean
    add_column :riders, :service_animal, :boolean
    add_column :riders, :wheelchair, :boolean
  end
end
