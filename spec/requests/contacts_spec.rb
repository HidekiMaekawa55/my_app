require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  let(:admin) { create(:user, admin: true) }
  let(:non_admin) { create(:user) }
  
  describe '#index' do
    before { visit contacts_path }
    context 'when not logged in' do
    end
    context 'not an administrator' do
    end
    context 'administrator' do
    end
  end
end