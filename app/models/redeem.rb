class Redeem < ApplicationRecord
  belongs_to :voucher
  after_create :add_redeem



  private

  def add_redeem
    self.voucher.nb_redeems += 1
    self.voucher.save!
  end


end
