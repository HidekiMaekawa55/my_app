module TestHelper
  
  def is_logged_in?
    !session[:user_id].nil?
  end
  
  # def log_in_as(user, password: 'password', remember_me: '1')
  #   post login_path, params: { session: { email: user.email,
  #                                         password: password,
  #                                         remember_me: remember_me } }
  # end
  
  def log_in_as(user)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end