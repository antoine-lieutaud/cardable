class VouchersController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @offers = @restaurant.offers
    @voucher = Voucher.new
    authorize @voucher
  end

  def create
    @offer = Offer.find(params.dig(:voucher, :offer))
    @restaurant = @offer.restaurant
    @voucher = Voucher.new(voucher_params)
    @voucher.offer = @offer
    # @voucher.save
    # qr = RQRCode::QRCode.new(restaurant_voucher_path(@restaurant, @voucher))
    # @voucher.qr_code = qr.to_s
    @voucher.save!
    redirect_to voucher_path(@voucher)
    authorize @voucher
  end

  def show
    @voucher = Voucher.find(params[:id])
    authorize @voucher
  end

  private

  def voucher_params
    params.require(:voucher).permit(:limit_use, :limit_date)
  end

end
