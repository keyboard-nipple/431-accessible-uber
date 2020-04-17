class AddCityToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :city, :string
  end
end
