class ApplicationController < ActionController::Base
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def require_login
    if session[:user_id].nil?
      flash[:error] = "A problem occured: You must log in to do that"
      redirect_to login_path
    end
  end
  
end
