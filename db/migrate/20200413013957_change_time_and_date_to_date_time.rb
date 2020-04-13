class ChangeTimeAndDateToDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column :rides, :timeAndDate, :datetime
  end
end
