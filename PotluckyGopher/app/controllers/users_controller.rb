class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @upcoming_events = Event.where("user_id=?", current_user.id) && Event.where("date >= ?", Date.today)
    @past_events = Event.where("user_id=?", current_user.id) && Event.where("date < ?", Date.today)

  end

  def new
    @user = User.new
 
  end

  def create
    @user = User.new(params[:user])
    if @user.save

      login @user
     
      redirect_to @user, :notice => 'User was successfully created.'
    else
      flash[:errors] = @user.errors.messages
      redirect_to root_path
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
