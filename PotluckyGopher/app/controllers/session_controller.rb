class SessionController < ApplicationController
  
  def oauth_create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id 
    redirect_to user_path(current_user), notice: "Signed in!"
  end

 def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      login user
      redirect_to user_path(current_user)
    else
      flash[:errors] = {"Login" => ["Email and Password combination not found"]}
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
