class VouchersController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @offers = @restaurant.offers
    @voucher = Voucher.new
    @zone = "offre"
    authorize @voucher
  end

  def create
    @offer = Offer.find(params.dig(:voucher, :offer))
    @restaurant = @offer.restaurant
    @voucher = Voucher.new(voucher_params)
    @voucher.offer = @offer
    authorize @voucher
    @voucher.save
    qr = RQRCode::QRCode.new(voucher_url(@voucher)).as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true,
      viewbox: true
    )
    @voucher.update(qr_code: qr)
    # # @voucher.save
    # # qr = RQRCode::QRCode.new(restaurant_voucher_path(@restaurant, @voucher))
    # # @voucher.qr_code = qr.to_s
    # @voucher.save!
    VoucherMailer.send_voucher(@voucher).deliver_now
    redirect_to home_path(@voucher)
  end

  def show
    @zone = "dashboard"
    @voucher = Voucher.find(params[:id])
    authorize @voucher
  end

  def index
    @zone = "dashboard"
    if params[:query].present?
      @vouchers = policy_scope(Voucher).where("customer_email ILIKE ?", "%#{params[:query]}%")
    else
      @vouchers = policy_scope(Voucher).all
    end
  end

  private

  def voucher_params
    params.require(:voucher).permit(:limit_use, :customer_email)
  end
end
