require 'rails_helper'

RSpec.describe 'Contacts', type: :system do
  subject { page }
  let(:admin) { create(:user, admin: true) }
  let(:non_admin) { create(:user) }
  
  describe '#index' do
    context 'when not logged in' do
      before { visit new_contact_path }
      it "'管理者専用ページ' is not displayed and impossible access to contacts/index" do
        aggregate_failures do
          is_expected.to have_link '管理者専用ページ', href: contacts_path, count: 0
          visit contacts_path
          is_expected.to have_current_path root_path
        end
      end
    end
    context 'not an administrator' do
      before do
        log_in_as(non_admin)
        visit new_contact_path
      end
      it "'管理者専用ページ' is not displayed and impossible access to contacts/index" do
        aggregate_failures do
          is_expected.to have_link '管理者専用ページ', href: contacts_path, count: 0
          visit contacts_path
          is_expected.to have_current_path root_path
        end
      end
    end
    context 'administrator' do
      before do
        log_in_as(admin)
        visit new_contact_path
      end
      it "'管理者専用ページ' is displayed and possible access to contacts/index" do
        aggregate_failures do
          is_expected.to have_link '管理者専用ページ', href: contacts_path, count: 1
          click_link '管理者専用ページ'
          is_expected.to have_current_path contacts_path
        end
      end
    end
  end
end