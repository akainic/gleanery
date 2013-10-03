class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @q = Restaurant.search(params[:q])
    @restaurants = @q.result(distinct: true)
  end

  def show

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
