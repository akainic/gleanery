class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @q = Restaurant.search(params[:q])
    @restaurants = @q.result(distinct: true)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def friendly(diet)
    record_rating(1,diet)
    redirect_to @restaurant
  end

  def unfriendly(diet)
    record_rating(0,diet)
    redirect_to @restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def record_rating(value,diet)
    if user_signed_in?
      rating = @restaurant.ratings.find_or_initialize_by(user_id: current_user_id)
      rating.diet = value
      rating.save
    end
  end
end
