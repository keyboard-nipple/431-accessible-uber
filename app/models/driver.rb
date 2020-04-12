class Driver < ApplicationRecord
    has_many :certifications, :dependent => :delete_all
    has_many :rides, dependent: :nullify
end
