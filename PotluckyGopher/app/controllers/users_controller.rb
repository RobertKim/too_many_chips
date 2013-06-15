class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = Event.where("user_id=?", current_user.id)
 

  end

  def new
    @user = User.new
 
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect_to @user
    else
      render :new
    end

  end

  def index
    @users = User.all

  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])


  end

 
  def destroy
    @user = User.find(params[:id])
    @user.destroy

  
  end
end
