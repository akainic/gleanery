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
    user = FactoryGirl.build(:user)
    previous_count = User.count

    visit root_path
    click_on 'Sign up'
    fill_in 'user_username', with: user.username
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password, :match => :prefer_exact
    fill_in 'user_password_confirmation', with: user.password_confirmation, :match => :prefer_exact

    click_button 'Sign up'

    expect(page).to have_content('Welcome to Gleanery!')
    expect(User.count).to eql(previous_count + 1)
  end

  scenario 'user does not enter valid criteria for sign up' do
    user = FactoryGirl.build(:user)
    previous_count = User.count

    visit root_path
    click_on 'Sign up'
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
    expect(User.count).to eql(previous_count)
  end

  scenario 'user enters an email or username that is already registered' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.build(:user)
    previous_count = User.count

    visit root_path
    click_on 'Sign up'
    fill_in 'user_username', with: user1.username
    fill_in 'user_email', with: user1.email
    fill_in 'user_password', with: user1.password, :match => :prefer_exact
    fill_in 'user_password_confirmation', with: user1.password_confirmation, :match => :prefer_exact

    click_button 'Sign up'

    expect(page).to have_content('has already been taken')
    expect(User.count).to eql(previous_count)
  end

  scenario 'user password and confirmation do not match' do
    user = FactoryGirl.build(:user)
    previous_count = User.count

    visit root_path
    click_on 'Sign up'
    fill_in 'user_username', with: user.username
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password, :match => :prefer_exact
    fill_in 'user_password_confirmation', with: 'Greens100', :match => :prefer_exact
    click_button 'Sign up'

    expect(page).to have_content("doesn't match")
    expect(User.count).to eql(previous_count)
  end

end
