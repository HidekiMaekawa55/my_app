class Like < ApplicationRecord
  belongs_to :user
  
  def Like.get_user(club_id)
    where(club_id: club_id).order("created_at DESC")
  end
end
