module SignInHelper

  def sign_in_as(user)
    visit root_path
    click_on 'Sign in'
    fill_in 'user_login', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign in'
  end

end
