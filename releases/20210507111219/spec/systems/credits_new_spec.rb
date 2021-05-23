require 'rails_helper'

RSpec.describe 'credits new', type: :system do
  subject { page }
  let!(:credit) { create(:credit) }
  before do
    visit credits_path
    click_link '授業評価を書く'
  end
  
  context 'unsuccessful new' do
    it 'データ数変化なし、render :new、flash(danger)の描画' do
      aggregate_failures do
        expect {
          fill_in '授業名',       with: ''
          fill_in '教授・講師名', with: ''
          fill_in 'Comment',      with: ''
          click_button 'Post'
        }.to change(Credit, :count).by(0)
        
        is_expected.to have_current_path '/credits'
        is_expected.to have_selector('.alert-danger')
      end
    end   
  end
  
  context 'successful new' do
    it 'データ数変化、credits_pathへのリダイレクト、flash(success)の描画' do
      aggregate_failures do
        expect {
          select '経営学部', from: 'credit_undergraduate'
          select '経営学科', from: 'credit_department'
          fill_in '授業名',       with: '成功'
          fill_in '教授・講師名', with: '成功'
          choose 'credit_fulfillment_5'
          choose 'credit_ease_5'
          choose 'credit_attendance_ほぼ毎回取る'
          choose 'credit_mid_test_format_テストのみ'
          choose 'credit_final_test_format_テストのみ'
          choose 'credit_item_持ち込み可能'
          choose 'credit_textbook_教科書必要'
          fill_in 'Comment', with: '成功です'
          click_button 'Post'
        }.to change(Credit, :count).by(1)
        
        is_expected.to have_current_path credits_path
        is_expected.to have_selector('.alert-success')
      end
    end
  end
end