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
        if certification.disabilities == 1
          n += 1
          break
        end
      end
    end
     
    if self.deaf
      certifications.each do |certification|
        if certification.disabilities == 2
          n += 1
          break
        end
      end
    end
     
    if self.service_animal
      certifications.each do |certification|
        if certification.disabilities == 3
          n += 1
          break
        end
      end
    end
     
    if self.wheelchair
      certifications.each do |certification|
        if certification.disabilities == 4
          n += 1
          break
        end
      end
    end
    
    return n
  end
  
  
  
end
