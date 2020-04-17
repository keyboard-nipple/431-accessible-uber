class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :riders, :blind_accessibility, :boolean, :default => false
    change_column :riders, :deaf, :boolean, :default => false
    change_column :riders, :service_animal, :boolean, :default => false
    change_column :riders, :wheelchair, :boolean, :default => false
  end
end
