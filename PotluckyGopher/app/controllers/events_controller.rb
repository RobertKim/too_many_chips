class EventsController < ApplicationController
  respond_to :json, :html

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @items = Item.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.create(params[:event], url: SecureRandom.urlsafe_base64, user_id: current_user.id)
    # items.each do |i|
    #   @event.items << EventItem.create(name: items[i[0]]["name"] , suggestion: items[i[0]]["suggestion"], quantity_needed: items[i[0]]["quantityNeeded"])
    # end
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
