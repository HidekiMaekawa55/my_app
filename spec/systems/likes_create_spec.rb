require 'rails_helper'

RSpec.describe 'likes create', type: :system do
  subject { page }
  let(:user) { create(:user) }
  let!(:club) { create(:club) }
  
  context 'not logged in user' do
    before { visit club_path(club.id) }
    it 'Likeデータ数変化なし、flashの描画、signup_pathにredirect' do
      aggregate_failures do
        expect {
          click_link "話を聞きたい"
          accept_confirm
        }.to change(Like, :count).by(0)
      
        is_expected.to have_selector('.alert-danger')
        is_expected.to have_current_path signup_path
      end
    end
  end
  
  context 'logged in user' do
    before do
      log_in_as(user) 
      visit club_path(club.id)
    end
    it 'Likeデータ数１増加、flashの描画、clubs/showにredirect' do
      aggregate_failures do
        expect {
          click_link "話を聞きたい"
          accept_confirm
          click_link "話を聞きたい"
          dismiss_confirm
        }.to change(Like, :count).by(1)
      
        is_expected.to have_selector('.alert-success')
        is_expected.to have_current_path "/clubs/#{club.id}"
      end
    end
  end
end