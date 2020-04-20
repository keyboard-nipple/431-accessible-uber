class Rider < ApplicationRecord
  has_many :rides, dependent: :destroy
  
  
  def num_needs()
    n = 0
    
    if self.blind_accessibility
      n += 1
    end
     
    if self.deaf
      n += 1
    end
     
    if self.service_animal
      n += 1
    end
     
    if self.wheelchair
      n += 1
    end
    
    return n
  end
  
  def num_matching_certifications(certifications)
    n = 0
     
    if self.blind_accessibility
      certifications.each do |certification|
        if certification.disabilities == 1 && certification.approved
          n += 1
          break
        end
      end
    end
     
    if self.deaf
      certifications.each do |certification|
        if certification.disabilities == 2 && certification.approved
          n += 1
          break
        end
      end
    end
     
    if self.service_animal
      certifications.each do |certification|
        if certification.disabilities == 3 && certification.approved
          n += 1
          break
        end
      end
    end
     
    if self.wheelchair
      certifications.each do |certification|
        if certification.disabilities == 4 && certification.approved
          n += 1
          break
        end
      end
    end
    
    return n
  end
  
  def check_eligibility(ride, driver)
    if ride.accepted == true
      return false
    end
    
    if self.city != driver.city
      return false
    end
    
    wheelchair_cert = false
    service_animal_cert = false
    driver.certifications.each do |certification|
      if certification.disabilities == 3 && certification.approved
        service_animal_cert = true
      elsif certification.disabilities == 4 && certification.approved
        wheelchair_cert = true
      end
    end
    
    if self.service_animal && (service_animal_cert == false)
      return false
    end
    
    if self.wheelchair && (wheelchair_cert == false)
      return false
    end
    
    return true
  
  end

  def num_rides_rated_by_driver
    num_rides = 0
    self.rides.each do |ride|
      if ride.driver_rated
        num_rides += 1
      end
    end
    return num_rides
  end
  

  
end
