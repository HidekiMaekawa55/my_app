class ContactsController < ApplicationController
  
  def index
  end
  
  def show
  end
  
  def new
    @contact = Contact.new
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
