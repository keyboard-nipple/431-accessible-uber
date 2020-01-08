class AddZipCodeToRiders < ActiveRecord::Migration[6.0]
  def change
    add_column :riders, :zip_code, :string
  end
end
