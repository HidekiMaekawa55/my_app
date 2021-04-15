require 'rails_helper'

RSpec.describe 'users signup', type: :system do
  subject { page }
  context 'enter an valid values' do
    before do
      visit signup_path
      fill_in 'Name', with: 'valid user'
      fill_in 'Email', with: 'valid@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Confirmation', with: 'password'
      click_button 'Create my account'
    end
    it 'gets an flash message' do
      is_expected.to have_selector('.alert-info')
    end
    it 'redirected to root_path' do
      is_expected.to have_current_path root_path
    end
  end
  
  context 'enter an invalid values' do
    before do
      visit signup_path
      fill_in 'Name', with: ' '
      fill_in 'Email', with: ' '
      fill_in 'Password', with: ' '
      fill_in 'Confirmation', with: ' '
      click_button 'Create my account'
    end
    it 'gets an errors' do
      is_expected.to have_selector('#error_explanation')
      is_expected.to have_selector('.field_with_errors')
    end
    it "render /users" do
      is_expected.to have_current_path '/users'
    end
  end
end