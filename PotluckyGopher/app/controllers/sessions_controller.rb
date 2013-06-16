class SessionsController < ApplicationController

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
    session.clear
    redirect_to root_path
  end

end
