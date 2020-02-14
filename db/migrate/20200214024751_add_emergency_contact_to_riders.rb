class AddEmergencyContactToRiders < ActiveRecord::Migration[6.0]
  def change
    add_column :riders, :emergency_contact, :string
  end
end
