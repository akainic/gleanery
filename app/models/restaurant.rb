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
  
  def rating(diet)
    self.ratings.inject(0) { | sum, v| sum + v.diet }
  end

end
