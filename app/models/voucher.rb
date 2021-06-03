class Voucher < ApplicationRecord
  belongs_to :offer
  has_many :redeems, dependent: :destroy
  before_create :set_expiration_date
  after_create :generate_qrcode
  after_create :update_price

  scope :unexpired, -> { where("expiration_date >= ?", Date.today) }
  scope :expired, -> { where("expiration_date < ?", Date.today) }

  def self.pending_stats(offer)
    vouchers = unexpired.joins(:offer).where("offers.id = ?", offer.id)
    number_of_vouchers = vouchers.count
    number_of_offers = vouchers.sum(:limit_use)
    number_of_redeems = Redeem.where(voucher_id: vouchers.pluck(:id)).count
    amount = offer.price * (number_of_offers - number_of_redeems)
    {
      coupons: number_of_vouchers,
      formules: number_of_offers - number_of_redeems,
      total: "#{amount}€"
    }
  end

  def self.consummate_stats(offer)
    vouchers = unexpired.joins(:offer, :redeems).where("offers.id = ?", offer.id)
    number_of_vouchers = vouchers.count
    number_of_redeems = Redeem.where(voucher_id: vouchers.pluck(:id)).count
    amount = offer.price * number_of_redeems
    {
      coupons: number_of_vouchers,
      validations: number_of_redeems,
      total: "#{amount}€"
    }
  end

  def self.expired_stats(offer)
    vouchers = expired.joins(:offer).where("offers.id = ?", offer.id)
    number_of_vouchers = vouchers.count
    number_of_offers = vouchers.sum(:limit_use)
    number_of_redeems = Redeem.where(voucher_id: vouchers.pluck(:id)).count
    amount = offer.price * (number_of_offers - number_of_redeems)
    {
      coupons: number_of_vouchers,
      formules: number_of_offers - number_of_redeems,
      total: "#{amount}€"
    }
  end

  # same thing as scope above
  # def self.expired
  #   Voucher.where("expiration_date < ?", Date.today)
  # end

  private

  def update_price
    total_voucher_price = offer.price * limit_use
    update(final_price: total_voucher_price)
  end

  def generate_qrcode
    qr = RQRCode::QRCode.new(Rails.application.routes.url_helpers.voucher_path(self))
    self.qr_code = qr.to_s
    save
  end

  def set_expiration_date
    offer_validity = offer.validity || 1
    expiration_date = Date.today + offer_validity
    self.expiration_date = expiration_date
  end
end
