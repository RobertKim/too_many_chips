class UsersController < ApplicationController
  before_filter :logged_in?, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_authorize_user, :only => [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      # UserMailer.signup_confirmation(@user.id).deliver
      redirect_to @user, :notice => 'Your account has been created.'
    else
      flash[:errors] = @user.errors.messages
      redirect_to root_path
    end
  end

  def edit
  end


  def update
  end

 
  def destroy
    @user.destroy
  end
end
