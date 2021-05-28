class OffersController < ApplicationController
  before_action :set_zone

  def index
    @restaurant = current_user.restaurants.find(params[:restaurant_id])
    if params[:archived ] == "true"
      @offers = policy_scope(@restaurant.offers).where(state: false)
    else
      @offers = policy_scope(@restaurant.offers).where(state: true)
    end
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @offer = Offer.new
    authorize @offer
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @offer = Offer.new(offer_params)
    @offer.restaurant = @restaurant
    @offer.state = true
    @offer.save
    authorize @offer
    redirect_to restaurant_offers_path(@restaurant)
  end

  def show
    @offer = Offer.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @offer
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @offer = @restaurant.offers.find(params[:id])
    authorize @offer
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @offer = @restaurant.offers.find(params[:id])
    authorize @offer
    @offer.update(offer_params)
    redirect_to restaurant_offer_path(@restaurant, @offer)
  end

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy
    redirect_to restaurant_offers_path(@offer.restaurant)
  end


  def archive
    @restaurant = Restaurant.find(params[:restaurant_id])
    @offer = @restaurant.offers.find(params[:id])
    authorize @offer
    @offer.state = false
    @offer.save
    redirect_to restaurant_offers_path(@offer.restaurant)
  end

private

  def offer_params
    params.require(:offer).permit(:price, :description, :restaurant, :state, :name, :validity)
    #scan-qr
  end

  def set_zone
    @zone = "coupon"
  end
end
