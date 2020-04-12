class AddMatchingRatioToRiders < ActiveRecord::Migration[6.0]
  def change
    add_column :riders, :matching_ratio, :float
  end
end
