class EventsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :destroy]
  
  def index
    @events = Event.paginate(page: params[:page]).order("created_at DESC")
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      flash.now[:danger] = @event.errors.full_messages
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path
    else
      flash.now[:danger] = "invalid"
      render 'edit'
    end
  end
  
  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "complite"
    redirect_to events_path
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :content)
    end
  
end
