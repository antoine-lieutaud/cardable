class DashboardsController < ApplicationController
  before_action :set_zone
  def show
    authorize current_user
  end

  def statistiques
    @offers = Offer.all
    @offer = Offer.find_by(name: params[:query]) if params[:query]
    # @offer = Offer.find_by(name: params[:query], state: true) if params[:query]

    authorize current_user
  end

  private

  def set_zone
    @zone = "dashboard"
  end
end
