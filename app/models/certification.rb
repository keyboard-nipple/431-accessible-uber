class Certification < ApplicationRecord
  belongs_to :driver
  has_one_attached :image
end
