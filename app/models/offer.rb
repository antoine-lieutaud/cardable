class Offer < ApplicationRecord
  belongs_to :restaurant
  has_many :vouchers, dependent: :destroy
  has_many :redeems, through: :vouchers

  def pending_stats
    unexpired_vouchers = vouchers.unexpired.select do |voucher|
      voucher.limit_use > voucher.redeems.count
    end
    number_of_vouchers = unexpired_vouchers.count
    number_of_offers = unexpired_vouchers.sum(&:limit_use)
    number_of_redeems = unexpired_vouchers.map(&:redeems).flatten.count
    amount = price * (number_of_offers - number_of_redeems)
    {
      coupons: number_of_vouchers,
      formules: number_of_offers - number_of_redeems,
      total: "#{amount}€"
    }
  end

  def consummate_stats
    unexpired_vouchers = vouchers.unexpired.select do |voucher|
      voucher.redeems.present?
    end
    number_of_vouchers = unexpired_vouchers.count
    number_of_redeems = redeems.count
    amount = price * number_of_redeems
    {
      coupons: number_of_vouchers,
      validations: number_of_redeems,
      total: "#{amount}€"
    }
  end

  def expired_stats
    expired_vouchers = vouchers.expired
    number_of_vouchers = expired_vouchers.count
    number_of_offers = expired_vouchers.sum(:limit_use)
    number_of_redeems = expired_vouchers.map(&:redeems).flatten.count
    amount = price * (number_of_offers - number_of_redeems)
    {
      coupons: number_of_vouchers,
      formules: number_of_offers - number_of_redeems,
      total: "#{amount}€"
    }
  end
end
