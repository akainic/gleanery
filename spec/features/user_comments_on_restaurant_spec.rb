require 'spec_helper'

feature 'user comments on a restaurant', %Q{
  As an authenticated user
  I want to comment on a restaurant
  So that I can provide more detail about the
    restaurant for other users
} do

  # Acceptance Criteria:
  #
  # * I must enter text in the comment field
  #   before I hit the submit button
  # * I must enter 5 or more characters
  # * I may only enter a maximum of 5,000 characters
  # * If I hit the submit button without entering
  #   text, I will receive an error message
  # * If I hit the submit button without entering at
  #   least 5 characters, I will receive an error
  #   message
  # * If I try to enter more than the maximum
  #   number of characters, I will not be able
  #   to type any more


  scenario 'user enters valid comment criteria' do
    user = FactoryGirl.create(:user)
    restaurant = FactoryGirl.create(:restaurant)
    previous_count = Comment.count

    sign_in_as(user)

    visit restaurant_path(restaurant)
    fill_in 'comment_comment', with: 'This restaurant has great vegan options'
    click_button 'Post'

    expect(page).to have_content('This restaurant has great vegan options')
    expect(Comment.count).to eql(previous_count + 1)
  end

  scenario 'user enters invalid comment criteria' do
    user = FactoryGirl.create(:user)
    restaurant = FactoryGirl.create(:restaurant)
    previous_count = Comment.count

    sign_in_as(user)

    visit restaurant_path(restaurant)
    fill_in 'comment_comment', with: 'Bug'
    click_button 'Post'
    expect(page).to have_content('Comments must be at least 5 characters long.')
    expect(Comment.count).to eql(previous_count)
  end

  scenario 'user attempts to post comment without signing in' do
    restaurant = FactoryGirl.create(:restaurant)

    visit restaurant_path(restaurant)

    expect(page).to_not have_content('Post comment')
  end
end
