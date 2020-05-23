class ApplicationController < ActionController::Base
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def require_login
    if session[:user_id].nil?
      flash[:error] = "You must be logged in to view this section"
      redirect_to login_path
    end
  end
  
end
