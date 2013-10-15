class Rating < ActiveRecord::Base

  validates_inclusion_of :vegan,
    in: [0,1,nil]

  validates_inclusion_of :vegetarian,
    in: [0,1,nil]

  validates_inclusion_of :gluten_free,
    in: [0,1,nil]

  belongs_to :restaurant,
    inverse_of: :ratings

  belongs_to :user,
    inverse_of: :ratings

end
