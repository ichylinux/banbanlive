# coding: UTF-8

module SignIn

  def sign_in(email)
    visit '/users/sign_in'
    fill_in 'Email', :with => email
    fill_in 'Password', :with => 'testtest'
    click_on 'Sign in'
    
    @_current_user = User.find_by_email(email)
  end

  def current_user
    @_current_user
  end
  
end

World(SignIn)
