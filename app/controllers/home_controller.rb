class HomeController < ApplicationController

  def index
    @q = Restaurant.search(params[:q])
    @restaurants = @q.result(distinct: true)
  end

  private

  def user_params
    params.require(:user).permit(:login)
  end

end
