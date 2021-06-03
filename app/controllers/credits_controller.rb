class CreditsController < ApplicationController
  before_action :admin_user, only: [:destroy]
  
  def index
    if (teacher_name = params[:teacher_name]) && (class_name = params[:class_name])
      @credits = Credit.paginate(page: params[:page]).target(teacher_name, class_name)
    else
      @credits = Credit.paginate(page: params[:page]).change_order('created_at')
    end
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
  
  def search
    @words = Credit.word_split(params[:word])
    if @words.length >= 3
      flash[:danger] = "３単語以上で検索をすることはできません。"
      redirect_to credits_path
    else
      @searches = Credit.word_search(@words)
    end
  end
  
  def easy
    @credits = Credit.paginate(page: params[:page]).change_order('ease')
  end
  
  def full
    @credits = Credit.paginate(page: params[:page]).change_order('fulfillment')
  end
  
  private
  
    def credit_params
      params.require(:credit).permit(:undergraduate, :department, :class_name, :teacher_name,
                                     :fulfillment, :ease, :attendance, :mid_test_format,
                                     :final_test_format, :item, :textbook, :comment)
    end
end
