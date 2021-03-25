class CreditsController < ApplicationController
  before_action :admin_user, only: [:destroy]
  
  def index
    @credits = Credit.all.order("created_at DESC")
  end

  def new
    @credit = Credit.new
  end
  
  def create
    @credit = Credit.new(credit_params)
    if @credit.save
      flash[:success] = "Thank you for your university information"
      redirect_to credits_path
    else
      flash.now[:danger] = @credit.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @credit = Credit.find(params[:id])
    if @credit.destroy
      flash[:success] = "complite"
      redirect_to credits_path
    else
      flash[:danger] = "error"
      redirect_to credits_path
    end
  end
  
  
  private
  
    def credit_params
      params.require(:credit).permit(:undergraduate, :department, :class_name, :teacher_name,
                                     :fulfillment, :ease, :attendance, :mid_test_format,
                                     :final_test_format, :item, :textbook, :comment)
    end
end
