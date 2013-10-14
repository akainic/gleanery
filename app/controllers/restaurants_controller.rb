class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @q = Restaurant.search(params[:q])
    @restaurants = @q.result(distinct: true)
  end

  def show
    @comment = @restaurant.comments.build
    if user_signed_in?
      @rating = @restaurant.ratings.find_or_initialize_by(user: current_user)
    else
      @rating = @restaurant.ratings.find(params[:restaurant_id])
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
