class RatingsController < ApplicationController
  before_action :find_restaurant

  def create
    @rating = @restaurant.ratings.find_or_initialize_by(user: current_user)
    #@rating = @restaurant.ratings.build(rating_params)
    #@rating.user = current_user

    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to restaurant_path(@restaurant) }
        format.js { render :update }
      else
        format.html { redirect_to restaurant_path(@restaurant),
          notice: "Your vote was not saved" }
        format.js {}
      end
    end
  end

  def update
    @rating = @restaurant.ratings.where(user: current_user).find(params[:id])

    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to restaurant_path(@restaurant) }
        format.js { render :update }
      else
        format.html { redirect_to restaurant_path(@restaurant),
          notice: "Your vote was not saved" }
        format.js {}
      end
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def rating_params
    params.require(:rating).permit(:vegan, :vegetarian, :gluten_free, :overall)
  end
end
