class ManuscriptsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :destroy]
  
  def index
    @manuscripts = Manuscript.all.order("created_at DESC")
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
      flash.now[:danger] = "invalid"
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
    @manuscript = Manuscript.find(params[:id])
    if @manuscript.destroy
      flash[:success] = "complite"
      redirect_to manuscripts_path
    else
      flash.now[:danger] = "error"
      render 'index'
    end
  end
  
  private
  
    def manuscript_params
      params.require(:manuscript).permit(:title, :content)
    end
  
end
