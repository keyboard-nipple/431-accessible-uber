class RemoveSubFromRiders < ActiveRecord::Migration[6.0]
  def change

    remove_column :riders, :sub, :string
  end
end
