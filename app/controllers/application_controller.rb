class ApplicationController < ActionController::Base
  protect_from_forgery
   include CurrentUser

  helper_method :current_user

  def check_auth
    logged_in?
    check_permissions
  end

  def check_permissions
    unless current_user.id == @user.id
      redirect_to user_path(current_user)
    end
  end
  
  def logged_in?
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end

  def load_and_authorize_user
    @user = User.find(params[:id])
    unless @user == current_user
      if current_user
        redirect_to user_path(current_user) 
      else
        redirect_to root_path
      end
    end
  end

end


