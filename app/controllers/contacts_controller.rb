class ContactsController < ApplicationController
  before_action :admin_user, only: [:index]
  
  def index
    @contacts = Contact.order("created_at DESC")
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "送信が完了しました。"
      redirect_to contacts_thanks_path
    else
      flash.now[:danger] = @contact.errors.full_messages
      render 'new'
    end
  end
  
  def thanks
  end
  
  private
  
    def contact_params
      params.require(:contact).permit(:title, :content, :name, :email)
    end
  
end
