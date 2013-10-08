require 'spec_helper'

feature 'user searches for restaurant by name', %Q{
  As a registered or unregistered user
  I want to be able to search for a restaurant by name
  So that I can see the restaurant's profile and ratings
} do 

  # Acceptance Criteria:
  #
  # * I must enter a restaurant name in the search bar 
  #   and hit the search button
  # * If I enter a restaurant name, I will be redirected 
  #   to a page with the matching result or results
  # * If I enter a restaurant name and there are no matches, 
  #   I will receive an error message indicating that no 
  #   results were found
  # * If I do not enter a restaurant name, I will receive 
  #   an error message that I must enter some search criteria

  scenario 'user enters valid restaurant name' do
    restaurant = FactoryGirl.create(:restaurant)

    visit restaurants_path
    fill_in :q_name_cont, with: restaurant.name
    click_button 'Search'

    expect(page).to have_content('1 restaurant found')
    expect(page).to have_content('Life Alive')
    expect(path).to eql(restaurants_path)
  end

  scenario 'user does not enter valid restaurant name' do

  end

  scenario 'user enters valid restaurant name and no results are found' do

  end

end