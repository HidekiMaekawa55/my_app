class ApplicationController < ActionController::Base
  include SessionsHelper
  
  
  private
    
    def admin_user
      unless current_user && current_user.admin?
        redirect_to root_url
        flash[:danger] = "You are not an administrator."
      end
    end
end
