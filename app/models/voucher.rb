class Voucher < ApplicationRecord
  belongs_to :offer

  has_many :redeems

  after_create :generate_qrcode
  after_create :update_price

  private

  def update_price
    total_voucher_price = self.offer.price * self.limit_use
    self.update(final_price: total_voucher_price)
  end

  def generate_qrcode
    qr = RQRCode::QRCode.new(Rails.application.routes.url_helpers.voucher_path(self))
    self.qr_code = qr.to_s
    self.save
  end
end
