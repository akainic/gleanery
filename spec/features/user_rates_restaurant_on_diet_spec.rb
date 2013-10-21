require 'spec_helper'

feature 'user rates restaurant on diet', %Q{
  As a registered and authenticated user
  I want to be able to rate the restaurant's ability
  to accommodate particular dietary restrictions
  So that I can share my experience at that restaurant
  with other users.
} do

  # Acceptance Criteria:
  #
  # * I must search for the restaurant I want to review
  # * I must select the option below the restaurant profile
  #   to review the restaurant
  # * I can enter a rating for any or all of the dietary
  #   restrictions listed
  # * I must select a save response button after entering
  #   my rating/ratings
  # * I may go back and change my ratings after already
  #   submitting them

  scenario 'user rates a restaurant as being friendly to vegans' do
    user = FactoryGirl.create(:user)
    restaurant = FactoryGirl.create(:restaurant)
    previous_count = restaurant.ratings.count

    sign_in_as(user)

    visit restaurant_path(restaurant)
    find(:css, ".vegan_yes").click

    expect(page).to have_content('100%')
    expect(restaurant.ratings.count).to eql(previous_count + 1)
  end

  scenario 'user changes their rating' do
    user = FactoryGirl.create(:user)
    restaurant = FactoryGirl.create(:restaurant)
    previous_count = restaurant.ratings.count

    sign_in_as(user)

    visit restaurant_path(restaurant)
    find(:css, ".vegan_yes").click
    find(:css, ".vegan_no").click

    expect(page).to have_content('0%')
    expect(restaurant.ratings.count).to eql(previous_count + 1)
  end

end
