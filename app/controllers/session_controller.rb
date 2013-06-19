class SessionController < ApplicationController

  def oauth_create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:id] = user.id 
    redirect_to your_profile_path, notice: "Signed in!"
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to your_profile_path, notice: "Signed in!"
    else
      flash[:errors] = {"Login" => ["Email and Password combination not found"]}
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
