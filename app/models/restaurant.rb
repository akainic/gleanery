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
    total_rating = ratings.where(vegan: 0).count + ratings.where(vegan: 1).count
    if total_rating == 0
      "0%"
    else
      score = ratings.where(vegan: 1).count / total_rating.to_f
      "#{(score * 100).round(0)}%"
    end
  end

  def vegetarian_rating
    total_rating = ratings.where(vegetarian: 0).count + ratings.where(vegetarian: 1).count
    if total_rating == 0
      "0%"
    else
      score = ratings.where(vegetarian: 1).count / total_rating.to_f
      "#{(score * 100).round(0)}%"
    end
  end

  def gluten_free_rating
    total_rating = ratings.where(gluten_free: 0).count + ratings.where(gluten_free: 1).count
    if total_rating == 0
      "0%"
    else
      score = ratings.where(gluten_free: 1).count / total_rating.to_f
      "#{(score * 100).round(0)}%"
    end
  end

  def overall_rating
    total_rating = ratings.where(overall: 0).count + ratings.where(overall: 1).count
    if total_rating == 0
      "0%"
    else
      score = ratings.where(overall: 1).count / total_rating.to_f
      "#{(score * 100).round(0)}%"
    end
  end
end
