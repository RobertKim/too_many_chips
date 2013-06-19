class GuestsController < ApplicationController

  def create
    @guest = Guest.new(params[:guest])    
    if @guest.save
      redirect_to root_path  
    else
      render :new
    end
  end

  def edit

  end

  def new
    @guest = Guest.new
    @guest.assigned_items.build
    @assigned_item = AssignedItem.new
  end

  def show
    @guest = Guest.find(params[:guest])
  end

  def destroy

  end
end

