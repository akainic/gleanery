module SignInHelper

  def sign_in_as(user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Login', with: user.email 
    fill_in 'Password', with: user.password 
    click_button 'Sign in'
  end
  
end