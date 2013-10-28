class CommentsController < ApplicationController
  before_action :is_authenticated?, only: [:create]
  before_action :find_restaurant

  def index
    @comment = @restaurant.comments
  end

  def create
    @comment = @restaurant.comments.build(comment_params)

    if @comment.save
      redirect_to restaurant_path(@restaurant),
        notice: "Comment successfully posted"
    else
      render 'new'
    end
  end

  def new
    @comment = Comment.new
  end

  private

  def is_authenticated?
    unless current_user
      raise ActiveRecord::RecordNotFound
    end
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(user: current_user)
  end
end
