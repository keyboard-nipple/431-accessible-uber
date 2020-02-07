class Certifications < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :blind_accessibility, :boolean
    
  end
end
