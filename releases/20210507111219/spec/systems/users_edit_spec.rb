require 'rails_helper'

RSpec.describe 'users edit', type: :system do
  subject { page }
  let(:user) { create(:user) }
  
  context 'unseccessful edit' do
    before do
      log_in_as(user)
      visit edit_user_path(user) 
      fill_in 'Name',         with: ' '
      fill_in 'Email',        with: 'invalid@example.com'
      fill_in 'Password',     with: 'foo'
      fill_in 'Confirmation', with: 'bar'
      click_button 'Save changes'
    end
    it 'render users/edit' do
      is_expected.to have_current_path "/users/#{user.id}"
    end
    it 'gets an errors' do
      is_expected.to have_selector('#error_explanation')
    end
  end
  context 'successful edit with friendly forwarding' do
    before do
      visit edit_user_path(user)
      log_in_as(user)
      fill_in 'Name',         with: 'edit user'
      fill_in 'Email',        with: 'edit@example.com'
      fill_in 'Password',     with: ''
      fill_in 'Confirmation', with: ''
      click_button 'Save changes'
    end
    it 'gets a flash message' do
      is_expected.to have_selector('.alert-success')
    end
    it 'redirected to root_path' do
      is_expected.to have_current_path user_path(user)
    end
    it 'reload'do
      expect(user.reload.name).to eq 'edit user'
    end
  end
end