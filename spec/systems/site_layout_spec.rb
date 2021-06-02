require 'rails_helper'

RSpec.describe 'site layout', type: :system do
  subject { page }
  before { visit root_path }
  let(:user) { create(:user) }
  
  context 'Access to root_path when not logged in' do
    it 'has the correct header links' do
      is_expected.to have_link 'NJS',     href: root_path
      is_expected.to have_link 'NEWS',    href: manuscripts_path
      is_expected.to have_link 'EVENT',   href: events_path
      is_expected.to have_link 'CLUB',    href: clubs_path
      is_expected.to have_link 'CREDIT',  href: credits_path
      is_expected.to have_link 'LOG IN',  href: login_path
      is_expected.to have_link 'SIGN UP', href: signup_path
    end
    it 'has the correct footer links' do
      is_expected.to have_link 'Home',           href: root_path
      is_expected.to have_link 'ご意見・ご要望', href: new_contact_path
      is_expected.to have_link '開発者紹介',     href: manager_path
    end
  end
  context 'Access to root_path when logged in' do
    it 'has the correct header links' do
      log_in_as(user)
      is_expected.to_not have_link 'LOG IN',  href: login_path
      is_expected.to_not have_link 'SIGN UP', href: signup_path
      is_expected.to have_link 'ACCOUNT',     href: '#'
    end
  end
end