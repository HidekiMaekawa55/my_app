require 'rails_helper'

RSpec.describe 'password resets', type: :system do
  subject { page }
  let(:user) { create(:user) }

  describe 'Email address input form' do
    before { visit new_password_reset_path }
    
    context 'invalid email address' do
      before do
        fill_in 'Email', with: 'invalid@example.com'
        click_button 'Send'
      end
      it 'gets a falsh messsage' do
        is_expected.to have_selector('.alert-danger')
      end
      it 'redirected to new_password_reset_path' do
        is_expected.to have_current_path new_password_reset_path
      end
    end
    context 'valid email address' do
      before do
        fill_in 'Email', with: user.email
        click_button 'Send'
      end
      it 'has been sent one email' do
        expect(ActionMailer::Base.deliveries.size).to eq(1)
      end
      it 'gets a flash messsage' do
        is_expected.to have_selector('.alert-info')
      end
      it 'redirected to root_path' do
        is_expected.to have_current_path root_path
      end
    end 
  end
  
  describe 'mailer for password reset and password resets form' do
    before { user.create_reset_digest }
    
    context 'invalid email address' do
      before { visit edit_password_reset_path(user.reset_token, email: "") }
      it 'redirected to root_path' do
        is_expected.to have_current_path root_path
      end
    end
    context 'invalid user' do
      before do
        user.toggle!(:activated)
        visit edit_password_reset_path(user.reset_token, email: user.email)
      end
      it 'redirected to root_path' do
        is_expected.to have_current_path root_path
      end
    end
    context 'invalid reset_token' do
      before { visit edit_password_reset_path('invalid token', email: user.email) }
      it 'redirected to root_path' do
        is_expected.to have_current_path root_path
      end
    end
    context 'All valid' do
      before { visit edit_password_reset_path(user.reset_token, email: user.email) }
      it 'template password_resets/edit' do
        is_expected.to have_current_path edit_password_reset_path(user.reset_token, email: user.email)
      end
      
      describe 'password resets form' do
        context 'If password and confirmation values are different' do
          before do
            fill_in 'Password', with: 'foobaz'
            fill_in 'Confirmation', with: 'barquux'
            click_button 'Update password'
          end
          it 'gets an errors' do
            is_expected.to have_selector('#error_explanation')
          end
        end
        context 'If password is empty' do
          before do
            fill_in 'Password', with: ''
            fill_in 'Confirmation', with: ''
            click_button 'Update password'
          end
          it 'gets an errors' do
            is_expected.to have_selector('#error_explanation')
          end
        end
        context 'valid password and confirmation' do
          before do
            fill_in 'Password', with: 'information'
            fill_in 'Confirmation', with: 'information'
            click_button 'Update password'
          end
          it 'gets a flash message' do
            is_expected.to have_selector('.alert-success')
          end
          it 'redirected to users/show' do
            is_expected.to have_current_path user_path(user)
          end
          it 'reset_digest is nil' do
            expect(user.reload.reset_digest).to be nil
          end
        end
      end
    end
  end
end