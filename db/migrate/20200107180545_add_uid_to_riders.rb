class AddUidToRiders < ActiveRecord::Migration[6.0]
  def change
    add_column :riders, :uid, :string
  end
end
