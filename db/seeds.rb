# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('db/restaurant_data.csv', { :headers => true} ) do |row|
  restaurant = Restaurant.find_or_create_by(name: row[0])
  restaurant.neighborhood = row[1]
  restaurant.street_address = row[2]
  restaurant.city = row[3]
end