class Restaurant < ActiveRecord::Base
  include Rateable

  validates_presence_of :name
  validates_presence_of :street_address
  validates_presence_of :city

  has_many :ratings,
    inverse_of: :restaurant,
    dependent: :nullify

  has_many :comments,
    inverse_of: :restaurant,
    dependent: :nullify

  rate :vegan, :vegetarian, :gluten_free, :overall
end
