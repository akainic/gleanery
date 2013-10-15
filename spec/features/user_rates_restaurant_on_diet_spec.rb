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

    sign_in_as(user)
    visit restaurant_path(restaurant)
    choose('rating_vegan_1')
    click_on 'Rate'

    expect(page).to have_content('100%')
  end

  pending 'user changes their rating' do
    user = FactoryGirl.create(:user)
    restaurant = FactoryGirl.create(:restaurant)
    previous_count = restaurant.rating(vegan)

    visit 'restaurants/#{restaurant.id}'
    click_on 'No'
    click_on 'Yes'

    expect(page).to have_content()
    expect(restaurant.rating(vegan)).to eql(previous_count + 1)
  end

end
