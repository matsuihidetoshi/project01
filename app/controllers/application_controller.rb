class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def correct_user
    user = User.find(params[:id])
    unless user == current_user || current_user.admin
      redirect_to root_url
    end
  end

  def admin_user
    unless current_user.admin
      redirect_to root_url
    end
  end
end
