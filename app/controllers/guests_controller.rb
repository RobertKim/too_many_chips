class GuestsController < ApplicationController
  def new
    @guest = Guest.new
    @guest.assigned_items.build
    @assigned_item = AssignedItem.new
  end

  def create
    @guest = Guest.new(params[:guest])
    
    if @guest.save
      # @assigned_items = @guest.assigned_items
    #   @items = 
    #   items = @assigned_items.each do |s|
    #     @assigned_items.event_item.item.name)
      render :json => root_path.to_json   
    #   render :json => @guest.assigned_items
    # end
    else
      render :json => @guest.errors.full_messages.join(','), :status => :unprocessable_entity      
    end
  end

  def edit

  end

  

  def show
    @guest = Guest.find(params[:guest])
  end

  def destroy

  end
end

