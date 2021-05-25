class RestaurantsController < ApplicationController
    def new
        @restaurant = Restaurant.new
        authorize @restaurant
      end
    
      def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.owner = current_user
        @restaurant.save
        authorize @restaurant
        redirect_to restaurant_path(@restaurant)
      end

    private

      def restaurant_params
        params.require(:restaurant).permit(:address, :name, :phone_number, :email)
      end

end

