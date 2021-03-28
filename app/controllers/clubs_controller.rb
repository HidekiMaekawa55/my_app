class ClubsController < ApplicationController
  
  def index
  end

  def show
    @club = Club.find(params[:id])
    @likes = Like.where(club_id: @club.id).order("created_at DESC")
  end
  
  def new
    @club = Club.new
  end
  
  def create
    @club = Club.new(club_params)
    if @club.save
      flash[:success] = "sucess"
      redirect_to new_club_path
    else
      flash[:danger] = "error"
      redirect_to clubs_path
    end
  end
  
  def edit
    @club = Club.find(params[:id])
  end
  
  def update
    @club = Club.find(params[:id])
    if @club.update(club_params)
      flash[:success] = "success"
      redirect_to clubs_taiikukai_kyugi_path
    else
      flash[:danger] = "error"
      render 'edit'
    end
  end
  
  private
  
    def club_params
      params.require(:club).permit(:name, :content, :date, :member,
                                   :place, :league, :email)
    end
end
