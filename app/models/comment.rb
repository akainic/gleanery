class Comment < ActiveRecord::Base

  validates_presence_of :comment
  validates_length_of :comment,
    within: 5..5000,
    message: "Comments must be at least 5 characters long."

  belongs_to :user,
    inverse_of: :comments

  belongs_to :restaurant,
    inverse_of: :comments
end
