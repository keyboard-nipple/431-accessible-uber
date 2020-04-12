class Certification < ApplicationRecord
  belongs_to :driver
  has_one_attached :image
  
  def self.get_certification_name(id)
    case id
      when 1
        return "Blind Accessibility"
      when 2
        return "Deaf"
      when 3
        return "Service Animal"
      when 4
        return "Wheelchair"
    end
  end
end
