class Restaurant < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :street_address
  validates_presence_of :city
  
end
