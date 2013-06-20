class GuestsController < ApplicationController
  def new
    @guest = Guest.new
    @guest.assigned_items.build
    @assigned_item = AssignedItem.new
  end

  def create
    @guest = Guest.new(params[:guest])

    if @guest.save
      session[:guest_id] = @guest.id
      @event = @guest.assigned_items.first.event_item.event
      render :json => event_path(@event).to_json
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

