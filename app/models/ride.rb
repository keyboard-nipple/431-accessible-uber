class Ride < ApplicationRecord
  belongs_to :rider
  belongs_to :driver, optional: true
end
