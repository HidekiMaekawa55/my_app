require 'rails_helper'

RSpec.describe 'ManuscriptsIndex', type: :system do
  subject { page }
  let(:admin) { create(:user, admin: true) }
  let!(:manuscripts) { create_list(:manuscript, 31) }
  let!(:manuscript_last) { create(:manuscript) }
  
  context 'Access to manuscript/index as admin user' do
    before do
      log_in_as(admin)
      click_link 'NEWS'
    end
    it 'template /manuscripts' do
      is_expected.to have_current_path manuscripts_path
    end
    it "has title 'News List | NJS'" do
      expect(page).to have_title full_title('News List') 
    end
    it 'has div.pagination' do
      is_expected.to have_selector('.pagination')
    end
    it "has 'News投稿' link" do
      is_expected.to have_link 'News投稿', href: new_manuscript_path
    end
    it "has '編集' and '削除' link" do
      is_expected.to have_link '編集', href: edit_manuscript_path(manuscript_last)
      is_expected.to have_link '削除', href: manuscript_path(manuscript_last)
    end
  end
end