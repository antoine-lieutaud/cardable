class Offer < ApplicationRecord
  belongs_to :restaurant
  has_many :vouchers
end
