require 'rails_helper'

RSpec.describe 'SessionsHelper', type: :helper do
  let(:user) { create(:user) }
  before { remember(user) }
  
  describe '#current_user' do
    context 'when session[:user_id] is nil' do
      it 'returns right user' do
        expect(current_user).to eq user
        expect(is_logged_in?).to be_truthy
      end
    end
    context 'when remember digest is wrong' do
      before { user.update_attribute(:remember_digest, User.digest(User.new_token)) }
      it 'returns nil' do
        expect(current_user).to eq nil
      end
    end
  end
end