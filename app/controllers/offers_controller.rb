class OffersController < ApplicationController
  before_action :set_zone
  def index
    @restaurant = current_user.restaurants.find(params[:restaurant_id])
    @offers = policy_scope(@restaurant.offers)
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
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  #def update
  #  @offer = Offer.find(params[:id])
  #  @offer.update(offer_params)
  #end

  #def delete
  #  @offer = Offer.find(params[:id])
  #  autorize(@offer)
# end

private

  def offer_params
    params.require(:offer).permit(:price, :description, :restaurant, :state, :name)
  end

  def set_zone
    @zone = "coupon"
  end
end
