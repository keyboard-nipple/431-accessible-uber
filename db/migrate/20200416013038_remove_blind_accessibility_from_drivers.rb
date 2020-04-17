class RemoveBlindAccessibilityFromDrivers < ActiveRecord::Migration[6.0]
  def change
    remove_column :drivers, :blind_accessibility
  end
end
