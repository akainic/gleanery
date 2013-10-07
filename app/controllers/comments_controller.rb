class CommentsController < ApplicationController
  before_action :find_restaurant

  def index
    @comment = @restaurant.comment
  end

  def create
    @comment = @restaurant.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to restaurant_path(@restaurant),
        notice: "Comment successfully posted"
    else
      redirect_to restaurant_path(@restaurant),
        notice: "Your comment was not posted"
    end
  end

  def new
    @comment = Comment.new
  end

  def show
  end


  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
