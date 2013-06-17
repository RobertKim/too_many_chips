class EventsController < ApplicationController
  respond_to :json, :html

  def show
    @event = Event.find(params[:id])
    session[:event_id] = @event.id
    @assigned_item = AssignedItem.new
  end

  def new
    @event = Event.new
    @item = @event.items.build
    @item.event_items.build
    @event.event_items.build
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    @event.url = SecureRandom.urlsafe_base64
    @event.user_id = current_user.id
    # items = params[:event][:event_items_attributes]
    # items.each do |item_array|
    #   @events_item = EventItem.create
    #   @event_item.item_id = Item.find_or_create_by_name(item_array[1][:name]).id
    #   @event_item.quantity_needed = item_array[1][:quantity_needed]
    #   @event_item.description = item_array[1][:description]
    #   @event_item.event_id = @event.id
    #   @event_item.save
    # end
    if @event.save
      redirect_to event_path(@event)
    else
      redirect_to new_event_path
    end
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
  respond_to do |format|
    format.html { redirect_to user_path(current_user) }
    format.xml  { head :ok }
  end
end
end

