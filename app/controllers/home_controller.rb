class HomeController < ApplicationController

  def index
  end

  private

  def user_params
    params.require(:user).permit(:login)
  end

end
