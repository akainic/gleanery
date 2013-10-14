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
    rating = ratings.where(vegan: 1).count / ratings.count.to_f
    (rating * 100).round(0)
  end

  def vegetarian_rating
    rating = ratings.where(vegetarian: 1).count / ratings.count.to_f
    (rating * 100).round(0)
  end

  def gluten_free_rating
    rating = ratings.where(gluten_free: 1).count / ratings.count.to_f
    (rating * 100).round(0)
  end

end
