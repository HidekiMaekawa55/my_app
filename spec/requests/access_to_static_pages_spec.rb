require 'rails_helper'

RSpec.describe 'Access to static_pages', type: :request do
  context 'get #home' do
    before { get root_path }
    it 'responds successfully' do
      expect(response).to have_http_status 200
    end
    it "has title 'NJS'" do
      expect(response.body).to include full_title('')
    end
  end
  
  context 'get #about' do
    before { get about_path }
    it 'responds successfully' do
      expect(response).to have_http_status 200
    end
    it "has title '開発者紹介 | NJS'" do
      expect(response.body).to include full_title('NJSの狙い')
    end
  end
  
  context 'get #manager' do
    before { get manager_path }
    it 'responds successfully' do
      expect(response).to have_http_status 200
    end
    it "has title 'NJSの狙い | NJS'" do
      expect(response.body).to include full_title('開発者紹介')
    end
  end
end