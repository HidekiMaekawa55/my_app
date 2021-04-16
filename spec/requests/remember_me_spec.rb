require 'rails_helper'

RSpec.describe 'remember me', type: :request do
  let!(:user) { create(:user) }
  
  context 'login with remembering' do
    before { log_in_with(user, '1') }
    it 'has remember cookies' do
      expect(cookies[:user_id].empty?).to be false
    end
  end
  
  context 'login without remembering' do
    before do
      log_in_with(user, '1')
      delete logout_path
      log_in_with(user, '0')
    end
    it 'does not have remember cookies' do
      expect(cookies[:user_id].empty?).to be true
    end
  end
end