# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('db/restaurant_data.csv', { :headers => true} ) do |row|
  restaurant_hash = { name: row[0], neighborhood: row[1], street_address: row[2], city: row[3] }
  Restaurant.create!(restaurant_hash) unless Restaurant.where(restaurant_hash).any?
end
