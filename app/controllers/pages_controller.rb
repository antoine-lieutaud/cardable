class PagesController < ApplicationController
  def home
    @restaurant = Restaurant.find_by(user_id: current_user.id)
  end

  def scan
  end

  def components
  end

  def intro

  end
end
