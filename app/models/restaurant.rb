class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :staffs
  has_many :users, through: :staffs
  has_many :offers
  has_many :vouchers, through: :offers

  def pending_stats
    unexpired_vouchers = vouchers.unexpired.select do |voucher|
      voucher.limit_use > voucher.redeems.count
    end
    number_of_vouchers = unexpired_vouchers.count
    number_of_offers = unexpired_vouchers.sum(&:limit_use)
    number_of_redeems = unexpired_vouchers.map(&:redeems).flatten.count

    # vouchers = Voucher.unexpired
    # number_of_vouchers = vouchers.count
    # number_of_offers = vouchers.sum(:limit_use)
    # number_of_redeems = Redeem.where(voucher_id: vouchers.pluck(:id)).count
    amount = 0
    unexpired_vouchers.each do |voucher|
      amount += voucher.offer.price * (voucher.limit_use - voucher.redeems.count)
    end
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
    number_of_redeems = unexpired_vouchers.map(&:redeems).flatten.count

    # vouchers = Voucher.unexpired
    # number_of_vouchers = vouchers.count
    # number_of_redeems = Redeem.where(voucher_id: vouchers.pluck(:id)).count
    amount = 0
    unexpired_vouchers.each do |voucher|
      amount += voucher.offer.price * voucher.redeems.count
    end
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

    # vouchers = Voucher.expired
    # number_of_vouchers = vouchers.count
    # number_of_offers = vouchers.sum(:limit_use)
    # number_of_redeems = Redeem.where(voucher_id: vouchers.pluck(:id)).count
    amount = 0
    expired_vouchers.each do |voucher|
      amount += voucher.offer.price * (voucher.limit_use - voucher.redeems.count)
    end
    {
      coupons: number_of_vouchers,
      formules: number_of_offers - number_of_redeems,
      total: "#{amount}€"
    }
  end
end
