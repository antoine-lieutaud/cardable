class Offer < ApplicationRecord
  belongs_to :restaurant
  has_many :vouchers

  def name
    description
  end
end
