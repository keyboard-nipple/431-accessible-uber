class Ride < ApplicationRecord
  belongs_to :rider
  belongs_to :driver, optional: true
  
  validate :timeAndDate_cannot_be_in_the_past, on: :create
  
  def formatted_date()
    if (!self.timeAndDate.nil?)
      return self.timeAndDate.to_formatted_s(:long)
    else
      return "N/A"
    end
  end
  
  def timeAndDate_cannot_be_in_the_past
    if (self.timeAndDate.present? && self.timeAndDate < Date.today)
      errors.add("Time and Date", "cannot be in the past")
    end
  end
end
