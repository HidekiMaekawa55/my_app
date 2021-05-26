class ManuscriptsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :destroy]
  
  def index
    @manuscripts = Manuscript.paginate(page: params[:page]).order("created_at DESC")
  end
  
  def show
    @manuscript = Manuscript.find(params[:id])
  end

  def new
  end
  
  def create
    @manuscript = Manuscript.new(manuscript_params)
    if @manuscript.save
      redirect_to manuscripts_path
    else
      flash.now[:danger] = @manuscript.errors.full_messages
      render 'new'
    end
  end

  def edit
    @manuscript = Manuscript.find(params[:id])
  end
  
  def update
    @manuscript = Manuscript.find(params[:id])
    if @manuscript.update(manuscript_params)
      redirect_to manuscripts_path
    else
      flash.now[:danger] = "invalid"
      render 'edit'
    end
  end
  
  def destroy
    Manuscript.find(params[:id]).destroy
    flash[:success] = "complite"
    redirect_to manuscripts_path
  end
  
  private
    def manuscript_params
      params.require(:manuscript).permit(:title, :content, :image)
    end
    
end
