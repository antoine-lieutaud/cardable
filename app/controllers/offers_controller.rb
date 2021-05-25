class OffersController < ApplicationController

  def index
    if params[:query].present?
      sql_query = ""
      @offers = policy_scope(Offer).where(sql_query, query: "%#{params[:query]}%")
    else
      @offers = policy_scope(Travel)
    end
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.restaurant = current_restaurant
    @offer.save
    authorize @offer
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
  end

  def delete
    @offer = Offer.find(params[:id])
    autorize(@offer)
  end
end
