class Voucher < ApplicationRecord
  belongs_to :offer

  has_many :redeems
end
