class AssignedItemsController < ApplicationController

def create
  @assigned_item = AssignedItem.new(params[:assigned_item])
  @event = Event.find(EventItem.find(@assigned_item.event_item_id).event_id)
  if @assigned_item.save
    redirect_to event_path(@event)
  end
end

end
