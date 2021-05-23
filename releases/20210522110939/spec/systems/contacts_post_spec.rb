require 'rails_helper'

RSpec.describe 'contacts post', type: :system do
  subject { page }
  before { visit new_contact_path }
  
  context 'title and textarea are empty' do
    before do
      fill_in 'タイトル ※必須', with: ''
      fill_in 'サイトの問題点やご意見、ご質問等の詳細をご入力ください。 ※必須', with: ''
      click_button 'Post'
    end
    it 'gets a flash message' do
      is_expected.to have_selector('.alert-danger')
    end
    it 'render new' do
      is_expected.to have_current_path '/contacts'
    end
  end
  
  context 'valid information' do
    before do
      fill_in 'タイトル ※必須', with: 'ご意見・ご要望テスト中'
      fill_in 'サイトの問題点やご意見、ご質問等の詳細をご入力ください。 ※必須', with: '問題ありません。'
      click_button 'Post'
    end
    it 'gets a flash message' do
      is_expected.to have_selector('.alert-success')
    end
    it 'redirected to new_contact_path' do
      is_expected.to have_current_path contacts_thanks_path
    end
  end
  
  context 'Add name and email informations' do
    before do
      fill_in 'タイトル ※必須', with: 'ご意見・ご要望テスト中'
      fill_in 'サイトの問題点やご意見、ご質問等の詳細をご入力ください。 ※必須', with: '問題ありません。'
      click_button 'Post'
    end
    it 'gets a flash message' do
      is_expected.to have_selector('.alert-success')
    end
    it 'redirected to new_contact_path' do
      is_expected.to have_current_path contacts_thanks_path
    end
  end
end