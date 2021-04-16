require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  
  describe 'before_action' do
    describe 'logged_in_user' do
      context 'Access to users/edit when not logged in' do
        before { get edit_user_path(user) }
        it 'gets a flash message' do
          expect(flash[:danger]).to be_truthy
        end
        it 'redirected to login_path' do
          expect(response).to redirect_to login_path
        end
      end
      context 'Access to users/update when not loggedn in' do
        before do
          patch user_path(user), params: { user: {
            name: user.name,
            email: user.email,
          } }
        end
        it 'gets a flash message' do
          expect(flash[:danger]).to be_truthy
        end
        it 'redirected to login_path' do
          expect(response).to redirect_to login_path
        end
      end
    end
    
    describe '#correct_user' do
      context 'Access to users/edit when logged in as wrong user' do
        before do
          log_in_with(other_user, '1')
          get edit_user_path(user)
        end
        it 'redirected to root_path' do
          expect(response).to redirect_to root_path
        end
      end
      context 'Access to users/update when logged in as wrong user' do
        before do
          log_in_with(other_user, '1')
          patch user_path(user), params: { user: {
            name: user.name,
            email: user.email,
          } }
        end
        it 'redirected to root_path' do
          expect(response).to redirect_to root_path
        end
      end
    end
  end
end