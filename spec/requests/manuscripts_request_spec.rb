require 'rails_helper'

RSpec.describe 'Manuscripts', type: :request do
  let(:admin) { create(:user, admin: true) }
  let(:non_admin) { create(:user) }
  let!(:manuscript) { create(:manuscript) }
  
  describe '#destroy' do
    context 'admin user' do
      before { log_in_with(admin) }
      it '削除の成功、フラッシュの描画、削除前の画面に戻る' do
        aggregate_failures do
          expect {
            delete manuscript_path(manuscript)
          }.to change(Manuscript, :count).by(-1)
          
          expect(flash[:success]).to be_truthy
          expect(response).to redirect_to manuscripts_path
        end
      end
    end
    context 'non_admin user' do
      before { log_in_with(non_admin) }
      it '削除の失敗、フラッシュの描画、トップページに戻る' do
        aggregate_failures do
          expect {
            delete manuscript_path(manuscript)
          }.to change(Manuscript, :count).by(0)
          
          expect(flash[:danger]).to be_truthy
          expect(response).to redirect_to root_path
        end
      end
    end
  end
end