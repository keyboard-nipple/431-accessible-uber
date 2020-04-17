class Driver < ApplicationRecord
  has_many :certifications, :dependent => :delete_all
  has_many :rides, dependent: :nullify
  
  def check_cert(disab)
      val = 0
      case disab
      when 'blind_accessibility'
          val = 1
      when 'deaf'
          val = 2
      when 'service_animal'
          val = 3
      when 'wheelchair'
          val = 4
      else
          raise 'Improper input for function check_cert'
      end
      
      self.certifications.each do |certification|
          if certification.disabilities == val
              return true
          end
      end
      
      return false
  end
    
  def num_rides_rated_by_rider
    num_rides = 0
    self.rides.each do |ride|
      if ride.rider_rated
        num_rides += 1
      end 
    end 
    return num_rides
  end
  
  def get_certification_list()
    listDis = ""
    self.certifications.each do |certification|
      if listDis.length > 0
        listDis = listDis + ", "
      end
      case certification.disabilities
      when 1
        listDis = listDis + "Blind Accessibility"
      when 2
        listDis = listDis +  "Deaf"
      when 3
        listDis = listDis + "Service Animal"
      when 4
        listDis = listDis + "Wheelchair"
      end
    end
    return listDis
  end
end
