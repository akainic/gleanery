class Restaurant < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :street_address
  validates_presence_of :city

  has_many :ratings,
    inverse_of: :restaurant,
    dependent: :nullify

  has_many :comments,
    inverse_of: :restaurant,
    dependent: :nullify

  def vegan_rating
    ratings.where(vegan: 1).count - ratings.where(vegan: 0).count
  end

  def vegetarian_rating
    ratings.where(vegetarian: 1).count - ratings.where(vegetarian: 0).count
  end

  def gluten_free_rating
    ratings.where(gluten_free: 1).count - ratings.where(gluten_free: 0).count
  end

end
