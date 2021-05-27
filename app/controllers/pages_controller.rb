class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @restaurant = Restaurant.find_by(user_id: current_user.id)
  end

  def components
  end
end
