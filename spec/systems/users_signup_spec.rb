require 'rails_helper'

RSpec.describe 'users signup', type: :system do
  subject { page }
  let(:user_last) { User.last }
  
  context 'valid sigunup information' do
    before do
      visit signup_path
      fill_in 'Name',         with: 'valid user'
      fill_in 'Email',        with: 'valid@example.com'
      fill_in 'Password',     with: 'password'
      fill_in 'Confirmation', with: 'password'
      click_button 'Create my account'
    end
    it 'gets a flash message' do
      is_expected.to have_selector('.alert-info')
    end
    it 'redirected to root_path' do
      is_expected.to have_current_path root_path
    end
    it 'has been sent one email' do
      expect(ActionMailer::Base.deliveries.size).to eq(1)
    end
    it 'activated is false' do
      expect(user_last.reload.activated).to eq false
    end
  end
  
  context 'account activation' do
    let(:user) { create(:user, activated: false) }
    
    it 'user is not activated' do
      expect(user.reload.activated).to eq false
    end
    
    shared_examples 'activated is false' do
      it { expect(user.reload.activated).to eq false }
    end
    
    context 'Log in without activation' do
      before { log_in_as(user) }
      it 'gets a flash message' do
        is_expected.to have_selector('.alert-warning', text: 'Account not activated')
      end
      it 'redirected to root_path' do
        is_expected.to have_current_path root_path
      end
      it_behaves_like 'activated is false'
    end
    context 'If the activation token is invalid' do
      before { visit edit_account_activation_path('invalid token', email: user.email) }
      it_behaves_like 'activated is false'
    end
    context 'If the email is invalid' do
      before { visit edit_account_activation_path(user.activation_token, email: 'invalid') }
      it_behaves_like 'activated is false'
    end
    context 'If the activation token and email address are correct' do
      before { visit edit_account_activation_path(user.activation_token, email: user.email) }
      it 'redirected to users/show' do
        is_expected.to have_current_path user_path(user)
      end
      it 'activated is true' do
        expect(user.reload.activated).to eq true
      end
    end
  end
  
  context 'invalid signup information' do
    before do
      visit signup_path
      fill_in 'Name',         with: ' '
      fill_in 'Email',        with: ' '
      fill_in 'Password',     with: ' '
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