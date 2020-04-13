class Ride < ApplicationRecord
  belongs_to :rider
  belongs_to :driver, optional: true
  
  def formatted_date()
    if (!self.timeAndDate.nil?)
      return self.timeAndDate.to_formatted_s(:long)
    else
      return "N/A"
    end
  end
end
