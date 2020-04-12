class RemoveDisabilitiesFromCertifications < ActiveRecord::Migration[6.0]
  def change

    remove_column :certifications, :blind_accessibility, :boolean

    remove_column :certifications, :deaf, :boolean

    remove_column :certifications, :service_animal, :boolean

    remove_column :certifications, :wheelchair, :boolean
  end
end
