module CurrentUser

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end

end