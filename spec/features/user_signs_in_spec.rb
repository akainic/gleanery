require 'spec_helper'

feature 'user signs in', %Q{
  As an unauthenticated user
  I want to enter my login credentials
  So I can gain access to my profile and preferences
} do 

  # Acceptance Criteria: 
  #
  # * I must enter my email address and password
  # * If my login credentials are valid, I will be 
  #   redirected to the home page
  # # If my login credentials are not valid, I will 
  #   receive an error message

  scenario 'user enters valid login credentials' do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    
    expect(page).to have_content('Welcome back to Gleanery! You have signed in successfully.')
    expect(current_path).to eql(root_path)
  end

  scenario 'user enters invalid login credentials' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'Greens100'
    click_button 'Sign in' 

    expect(page).to have_content('Invalid email or password') 
    expect(current_path).to eql(new_user_session_path)
  end

end