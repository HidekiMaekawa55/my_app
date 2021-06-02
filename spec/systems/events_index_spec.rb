require 'rails_helper'

RSpec.describe 'ManuscriptsIndex', type: :system do
  subject { page }
  let(:admin) { create(:user, admin: true) }
  let(:non_admin) { create(:user) }
  let!(:events) { create_list(:event, 31) }
  let!(:event_last) { create(:event) }
  
  context 'Access to manuscript/index as admin user' do
    before do
      log_in_as(admin)
      click_link 'EVENT'
    end
    it 'template /events' do
      is_expected.to have_current_path events_path
    end
    it "has title 'Event List | NJS'" do
      expect(page).to have_title full_title('Event List') 
    end
    it 'has div.pagination' do
      is_expected.to have_selector('.pagination')
    end
    it "has 'Event投稿' link" do
      is_expected.to have_link 'Event投稿', href: new_event_path
    end
  end
  
  context 'Access to event/index as non_admin user' do
    before do
      log_in_as(non_admin)
      click_link 'EVENT'
    end
    it "does not have 'News投稿' link" do
      is_expected.not_to have_link 'Event投稿', href: new_event_path
    end
    it "does not have '編集' and '削除' link" do
      is_expected.not_to have_link '編集', href: edit_event_path(event_last)
      is_expected.not_to have_link '削除', href: event_path(event_last)
    end
  end
end