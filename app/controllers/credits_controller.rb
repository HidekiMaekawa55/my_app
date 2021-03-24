class CreditsController < ApplicationController
  
  def index
  end

  def show
  end

  def new
    @credit = Credit.new
  end
  
  def create
    @credit = Credit.new(credit_params)
    if @credit.save
      flash[:success] = "Thank you your university information"
      redirect_to credits_path
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  
  private
  
    def credit_params
      params.require(:credit).permit(:undergraduate, :department, :class_name, :teacher_name,
                                     :fulfillment, :ease, :attendance, :mid_test_format,
                                     :final_test_format, :item, :textbook, :comment)
    end
end
