class Driver < ApplicationRecord
    has_many :certifications, :dependent => :delete_all
end
