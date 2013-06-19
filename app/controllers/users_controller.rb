class UsersController < ApplicationController
  before_filter :logged_in?, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_authorize_user, :only => [:show, :edit, :update, :destroy]

  def your_profile
    @user = current_user
    render :show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      # UserMailer.signup_confirmation(@user.id).deliver
      redirect_to your_profile_path, notice: "Signed in!"
    else
      flash[:errors] = @user.errors.messages
      redirect_to root_path
    end
  end

  def destroy
    @user.destroy
  end



end
