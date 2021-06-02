class Redeem < ApplicationRecord
  belongs_to :voucher
  after_create :add_redeem

  private

  def add_redeem
    voucher.nb_redeems += 1
    voucher.save!
  end
end
