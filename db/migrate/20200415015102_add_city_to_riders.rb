class AddCityToRiders < ActiveRecord::Migration[6.0]
  def change
    add_column :riders, :city, :string
  end
end
