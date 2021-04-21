require 'rails_helper'

RSpec.describe 'credits search', type: :system do
  subject { page }
  let!(:credit_manage)  { create(:credit, department: "経営学科", 
                                 class_name: "経営学総論A", teacher_name: "経営太郎") }
  let!(:credit_manage2) { create(:credit, department: "経営学科", 
                                 class_name: "経営学総論A", teacher_name: "経営二郎") }
  let!(:credit_manage3) { create(:credit, department: "経営学科", 
                                 class_name: "経営学総論B", teacher_name: "経営太郎") }
  before do
    visit credits_path
  end
  
  context "search by '経営太郎" do
    before do
      fill_in 'word', with: credit_manage.teacher_name
      click_button 'search'
    end
    it '[表示]経営学総論A(経営太郎)、経営学総論B(経営太郎)　[非表示]経営学総論A(経営二郎)' do
      is_expected.to have_link "#{credit_manage.class_name}　(#{credit_manage.teacher_name}先生)"
      is_expected.not_to have_link "#{credit_manage2.class_name}　(#{credit_manage2.teacher_name}先生)"
      is_expected.to have_link "#{credit_manage3.class_name}　(#{credit_manage3.teacher_name}先生)"
    end
  end
  
  context "search by '経営学総論A" do
    before do
      fill_in 'word', with: '経営学総論A'
      click_button 'search'
    end
    it '[表示]経営学総論A(経営太郎)、経営学総論A(経営二郎)　[非表示]経営学総論B(経営太郎)' do
      is_expected.to have_link "#{credit_manage.class_name}　(#{credit_manage.teacher_name}先生)"
      is_expected.to have_link "#{credit_manage2.class_name}　(#{credit_manage2.teacher_name}先生)"
      is_expected.not_to have_link "#{credit_manage3.class_name}　(#{credit_manage3.teacher_name}先生)"
    end
  end
  
  context "search by '経営太郎　経営学総論A" do
    before do
      fill_in 'word', with: '経営太郎　経営学総論A'
      click_button 'search'
    end
    it '[表示]経営学総論A(経営太郎)　[非表示]経営学総論A(経営二郎)、経営学総論B(経営太郎)' do
      is_expected.to have_link "#{credit_manage.class_name}　(#{credit_manage.teacher_name}先生)"
      is_expected.not_to have_link "#{credit_manage2.class_name}　(#{credit_manage2.teacher_name}先生)"
      is_expected.not_to have_link "#{credit_manage3.class_name}　(#{credit_manage3.teacher_name}先生)"
    end
  end
  
  context "search with 3 words" do
    before do
      fill_in 'word', with: 'invalid invalid invalid'
      click_button 'search'
    end
    it 'gets a flash message' do
      is_expected.to have_selector('.alert-danger')
    end
    it 'redirect_to credits_path' do
      is_expected.to have_current_path credits_path
    end
  end
end