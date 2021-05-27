class DashboardsController < ApplicationController
  before_action :set_zone
  def show
    authorize current_user
  end
  private

  def set_zone
    @zone = "dashboard"
  end
end
