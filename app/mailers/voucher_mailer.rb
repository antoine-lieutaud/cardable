class VoucherMailer < ApplicationMailer
    default from:'cardable.pro@gmail.com'
    def send_voucher(voucher)
      @voucher = voucher
      mail(to: voucher.customer_email, subject: "Your voucher")
    end
end
