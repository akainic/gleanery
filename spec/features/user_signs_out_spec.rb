require 'spec_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to sign out of my account
  So that I protect my account
} do

  # Acceptance Criteria:
  #
  # * I must first be signed in
  # * If I click on the sign out button, my session
  #   will be ended and I will be redirected to 
  #   the home page

  scenario 'user signs out of current session' do
    user = FactoryGirl.create(:user)

    sign_in_user(user)

  end  


  
end