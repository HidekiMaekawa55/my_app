class LikesController < ApplicationController
  
  def create
    @like = Like.new(user_id: current_user.id, club_id: params[:club_id])
    if @like.save
      flash[:success] = "データ送信完了しました。"
      redirect_to("/clubs/#{params[:club_id]}")
    else
      flash[:danger] = "error"
      redirect_to("/clubs/#{params[:club_id]}")
    end
  end
  
end
