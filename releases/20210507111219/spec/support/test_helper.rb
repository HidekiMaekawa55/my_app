module TestHelper
  
  def is_logged_in?
    !session[:user_id].nil?
  end
  
  def log_in_as(user)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    uncheck 'session_remember_me'
    click_button 'Log in'
  end
  
  def log_in_with(user, remember_me: '1')
    post login_path, params: { session: {
      email: user.email,
      password: user.password,
      remember_me: remember_me,
    } }
  end
  
  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token),
                   reset_sent_at: Time.zone.now)
  end
  
end