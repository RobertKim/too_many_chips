class EventsController < ApplicationController
  respond_to :json, :html

  def show
    @event = Event.find(params[:id])
    @items = @event.items
    session[:event_id] = @event.id
    @assigned_item = AssignedItem.new
  end

  def new
    @event = Event.new
    @item = @event.items.build
    @item.event_items.build
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.create(params[:event], url: SecureRandom.urlsafe_base64, user_id: current_user.id)
    
    if @event.save
      redirect_to edit_event_path(@event)
    else
      redirect_to new_event_path
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to event_path
    else
      redirect_to edit_event_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end
end
