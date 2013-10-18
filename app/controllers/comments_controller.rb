class CommentsController < ApplicationController
  before_action :find_restaurant

  def index
    @comment = @restaurant.comments
  end

  def create
    @comment = @restaurant.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to restaurant_path(@restaurant),
        notice: "Comment successfully posted"
    elsif @comment.comment.length < 5
      redirect_to restaurant_path(@restaurant),
        notice: "Your comment was not posted. Comments must be at least 5 characters long."
    else
      redirect_to restaurant_path(@restaurant),
        notice: "Your comment was not posted."
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
    params.require(:comment).permit(:comment)
  end
end
