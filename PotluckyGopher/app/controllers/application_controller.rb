class ApplicationController < ActionController::Base
  protect_from_forgery
  include CurrentUser

  helper_method :current_user
end
