require 'spec_helper'

feature 'user signs up', %Q{
  As an unregistered user
  I want to sign up for Gleanery
  So that I can create a profile and manage my preferences.
} do 

  # Acceptance Criteria:
  #
  # * I must enter a valid username and email address
  # * If my username or email have already been registered,
  #   I will receive an error message that the username or email
  #   is already registered
  # * I must enter a valid password
  # * I must confirm my password
  # * If my passwords do not match, I must reenter the password
  #   and confirmation
  # * If I enter all of the valid criteria, I will be redirected to
  #   a profile page
  # * If I do not enter all of the valid criteria, I will receive
  #   an error message that I must reenter criteria

  scenario 'user enters valid criteria for sign up' do


  end

  scenario 'user does not enter valid criteria for sign up' do


  end

  scenario 'user enters an email that is already registered' do


  end

  scenario 'user enters a username that is already registered' do


  end

  scenario 'user password and confirmation do not match' do 


  end

end