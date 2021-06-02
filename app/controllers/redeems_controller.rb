class RedeemsController < ApplicationController
  # before_action :set_zone

  def create
    @redeem = Redeem.new
    @voucher = Voucher.find(params[:voucher_id])
    @redeem.voucher = @voucher
    @redeem.save!
    redirect_to voucher_path(@voucher)
    authorize @redeem
  end

  def set_zone
    @zone = "scanner"
  end
end
