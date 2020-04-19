class ChangeCertificationsApprovedDefault2 < ActiveRecord::Migration[6.0]
  def change
    change_column_default :certifications, :approved, nil
  end
end
