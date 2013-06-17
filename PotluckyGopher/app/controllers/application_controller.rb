class ApplicationController < ActionController::Base
  protect_from_forgery
   include CurrentUser

  # def authenticate!
  #   redirect_to root_path unless current_user
  # end

  # def login user
  #   session[:id] = user.id
  # end

  helper_method :current_user

end


