class AddDisabilitiesToCertifications < ActiveRecord::Migration[6.0]
  def change
    add_column :certifications, :disabilities, :integer
  end
end
