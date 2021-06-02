class DashboardsController < ApplicationController
  before_action :set_zone
  def show
    authorize current_user
  end

  def statistiques
    @offers = Offer.where.not(name: "")
    if params.dig(:search, :offer)
      @offer = Offer.find(params.dig(:search, :offer))
      @pending_stats = @offer.pending_stats
      @consummate_stats = @offer.consummate_stats
      @expired_stats = @offer.expired_stats
    else
      @pending_stats = current_user.restaurants.first.pending_stats
      @consummate_stats = current_user.restaurants.first.consummate_stats
      @expired_stats = current_user.restaurants.first.expired_stats
    end

    authorize current_user
  end

  private

  def set_zone
    @zone = "dashboard"
  end
end
