class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @q = Restaurant.search(params[:q])
    if params[:diet]
      @restaurants = @q.result(distinct: true).sort_by { |restaurant| restaurant.method(params[:diet]+'_rating').call().to_i }.reverse
    else
      @restaurants = @q.result(distinct: true)
    end
  end

  def show
    @comment = @restaurant.comments.build
    if user_signed_in?
      @rating = @restaurant.ratings.find_or_initialize_by(user: current_user)
    end
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
