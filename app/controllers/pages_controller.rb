class PagesController < ApplicationController
  def home
    @restaurant = Restaurant.find_by(user_id: current_user.id)
  end

  def components
  end
end
