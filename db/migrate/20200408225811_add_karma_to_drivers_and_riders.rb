class AddKarmaToDriversAndRiders < ActiveRecord::Migration[6.0]
  def change
    add_column :riders, :karma, :integer, :default => 0
    add_column :drivers, :karma, :integer, :default => 0
  end
end
