class CreditsController < ApplicationController
  before_action :admin_user, only: [:destroy]
  
  def index
    if params[:class_name]
      @credits = Credit.paginate(page: params[:page]).where('teacher_name Like ? and class_name Like ?', params[:teacher_name], params[:class_name] ).order("created_at DESC")
    else
      @credits = Credit.paginate(page: params[:page]).order("created_at DESC")
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
    @word = params[:word]
    @words = @word.gsub(/　/," ").lstrip.split(/[[:blank:]]+/)
    if @words.length >= 3
      flash[:danger] = "３単語以上で検索をすることはできません。"
      redirect_to credits_path
    else
      @searches = Credit.where('teacher_name Like ? and class_name Like ?', "%#{@words[0]}%", "%#{@words[1]}%")
      if !@searches.blank?
        @searches
      else @searches = Credit.where('teacher_name Like ? and class_name Like ?', "%#{@words[1]}%", "%#{@words[0]}%")
        @searches
      end
    end
  end
  
  def easy
    @credits = Credit.paginate(page: params[:page]).order("ease DESC")
  end
  
  def full
    @credits = Credit.paginate(page: params[:page]).order("fulfillment DESC")
  end
  
  private
  
    def credit_params
      params.require(:credit).permit(:undergraduate, :department, :class_name, :teacher_name,
                                     :fulfillment, :ease, :attendance, :mid_test_format,
                                     :final_test_format, :item, :textbook, :comment)
    end
end
