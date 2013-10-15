class RatingsController < ApplicationController
  before_action :find_restaurant

  def create
    @rating = @restaurant.ratings.build(rating_params)
    @rating.user = current_user
    if @rating.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to restaurant_path(@restaurant),
        notice: "Your vote was not saved"
    end
  end

  def update
    @rating = @restaurant.ratings.where(user: current_user).find(params[:id])
    if @rating.update(rating_params)
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to restaurant_path(@restaurant),
        notice: "Your vote was not saved"
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def rating_params
    params.require(:rating).permit(:vegan, :vegetarian, :gluten_free)
  end
end
