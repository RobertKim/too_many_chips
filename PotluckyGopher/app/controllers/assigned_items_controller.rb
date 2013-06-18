class AssignedItemsController < ApplicationController

  def create
    @assigned_item = AssignedItem.new(params[:assigned_item])
    @event = Event.find(EventItem.find(@assigned_item.event_item_id).event_id)
    if @assigned_item.save
      redirect_to assigned_item_path(@assigned_item)
    end
  end

  def edit

  end

  def show
    @assigned_items = AssignedItem.find(params[:id]).find_all_user_items
  end

  def destroy

  end
end

