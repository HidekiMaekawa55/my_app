require 'rails_helper'

RSpec.describe 'Clubs', type: :system do
  subject { page }
  let!(:club) { create(:club) }
  let(:user) { create(:user) }
  let(:official) { create(:user, email: "taiikukai_american_football@njs.com") }
  let(:admin) { create(:user, admin: true) }
  
  describe '#show' do
    context 'not logged in' do
      before { visit club_path(club.id) }
      it 'not displayed list of interested users' do
        is_expected.not_to have_content '興味を持ってくれている方々'
      end
      it 'not displayed clubs/edit link ' do
        is_expected.not_to have_link '編集'
      end
    end
    context 'normal user' do
      before do
        log_in_as(user)
        visit club_path(club.id)
      end
      it 'not displayed list of interested users' do
        is_expected.not_to have_content '興味を持ってくれている方々'
      end
      it 'not displayed clubs/edit link ' do
        is_expected.not_to have_link '編集'
      end
    end
    context 'club official user' do
      before do
        log_in_as(official)
        visit club_path(club.id)
      end
      it 'displayed list of interested users' do
        is_expected.to have_content '興味を持ってくれている方々'
      end
      it 'not displayed clubs/edit link ' do
        is_expected.not_to have_link '編集'
      end
    end
    context 'admin user' do
      before do
        log_in_as(admin)
        visit club_path(club.id)
      end
      it 'displayed list of interested users' do
        is_expected.to have_content '興味を持ってくれている方々'
      end
      it 'displayed clubs/edit link ' do
        is_expected.to have_link '編集', href: edit_club_path(club.id)
      end
    end
  end
end