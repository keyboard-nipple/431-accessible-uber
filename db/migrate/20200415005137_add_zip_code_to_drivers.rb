class AddZipCodeToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :zip_code, :string
  end
end
