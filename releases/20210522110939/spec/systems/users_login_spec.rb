require 'rails_helper'

RSpec.describe 'users login', type: :system do
  subject { page }
  let!(:user) { create(:user, email: 'valid@example.com', password: 'password') }
  before do
    visit login_path
  end
  
  context 'login with valid information followed by logout' do
    before do
      fill_in 'Email',    with: 'valid@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end
    it 'redirected to users/show' do
      is_expected.to have_current_path user_path(user)
    end
    it '[IN]アカウントページ、[OUT]ログインページ。' do
      is_expected.to_not have_link 'LOG IN', href: login_path
      is_expected.to have_link 'ACCOUNT',    href: '#'
    end
    context 'Log out when logged in' do
      before do
        click_link 'ACCOUNT'
        click_link 'Log out'
      end
      it 'redirected to root_path' do
        is_expected.to have_current_path root_path
      end
      it '[IN]ログインページ、[OUT]アカウントページ。' do
        is_expected.to have_link 'LOG IN',      href: login_path
        is_expected.to_not have_link 'ACCOUNT', href: '#'
      end
      context 'Log out when not logged in' do
        it 'redirected to root_path' do
          is_expected.to have_current_path root_path
        end
      end
    end
  end
  
  context 'login with invalid information' do
    before do
      fill_in 'Email',    with: ' '
      fill_in 'Password', with: ' '
      click_button 'Log in'
    end
    it 'gets an flash message' do
      is_expected.to have_selector('.alert-danger')
    end
    it 'render /login' do
      is_expected.to have_current_path '/login'
    end
  end
  
  context 'login with valid email/invalid password' do
    before do
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: ' '
      click_button 'Log in'
    end
    it 'gets an flash message' do
      is_expected.to have_selector('.alert-danger')
    end
    it 'render /login' do
      is_expected.to have_current_path '/login'
    end
  end
  
end