class Voucher < ApplicationRecord
  belongs_to :offer

  has_many :redeems

  after_create :generate_qrcode

  def generate_qrcode
    qr = RQRCode::QRCode.new(Rails.application.routes.url_helpers.voucher_path(self))
    self.qr_code = qr.to_s
    self.save
  end
end
