class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate!
    redirect_to root_path unless current_user
  end

  def login user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

end

# class ApplicationController < ActionController::Base
#   protect_from_forgery

#   def current_user
# 		if session[:id]
# 			@current_user ||= User.find(session[:id])
# 		end
# 	end

# end


