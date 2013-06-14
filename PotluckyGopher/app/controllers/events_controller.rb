class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @item = Item.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to event_path(@event)
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
