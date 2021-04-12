require 'rails_helper'

RSpec.describe 'site layout', type: :system do
  context 'access to root_path' do
    before { visit about_path }
    it 'has the correct links' do
      expect(page).to have_link nil, href: root_path
      expect(page).to have_link 'NEWS', href: manuscripts_path
      expect(page).to have_link 'EVENT', href: events_path
      expect(page).to have_link 'CLUB', href: clubs_path
      expect(page).to have_link 'CREDIT', href: credits_path
      expect(page).to have_link 'LOG IN', href: login_path
      expect(page).to have_link 'SIGN UP', href: signup_path
    end
  end
end