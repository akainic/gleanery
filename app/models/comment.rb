class Comment < ActiveRecord::Base

  validates_presence_of :comment
  validates_length_of :comment,
    minimum: 5,
    maximum: 5000,
    short: "Comment must be at least 5 characters long"

  belongs_to :user,
    inverse_of: :comments

  belongs_to :restaurant,
    inverse_of: :comments
end
