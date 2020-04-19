class ChangeCertificationsApprovedDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :certifications, :approved, :boolean
  end
end
