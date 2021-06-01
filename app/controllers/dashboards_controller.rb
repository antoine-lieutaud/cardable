class DashboardsController < ApplicationController
  before_action :set_zone
  def show
    authorize current_user
  end

  def statistiques
    @offers = Offer.where.not(name: "")
    if params.dig(:search, :offer)
      @offer = Offer.find(params.dig(:search, :offer))
      @pending_stats = Voucher.pending_stats(@offer)
      @consummate_stats = Voucher.consummate_stats(@offer)
      @expired_stats = Voucher.expired_stats(@offer)
    end

    authorize current_user
  end

  private

  def set_zone
    @zone = "dashboard"
  end
end
