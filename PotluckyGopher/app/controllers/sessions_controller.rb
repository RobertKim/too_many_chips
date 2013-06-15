class SessionsController < ApplicationController

 def new
    @user = User.find_by_email(params[:email]) 
    if @user && @user.authenticate(params[:password]) 
      session[:id] = @user.id 
      redirect_to user_path(@user)
    else 
      @user = User.new
      render "pages/index" 
    end
  end

  def destroy
    session[:id] = nil
    session.destroy
    redirect_to root_path
  end
end
