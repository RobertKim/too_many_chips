class EventsController < ApplicationController
  respond_to :json, :html

  def show
    @event = Event.find(params[:id])
    @items = @event.items
  end

  def new
    @event = Event.new
    @item = Item.new
    @items = Item.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    items = params.delete(:items)
    @event = Event.create(name: params[:eventName], description: params[:desc], date: params[:date], location: params[:place], url: SecureRandom.urlsafe_base64)
    items.each do |i|
      @event.items << Item.create(name: items[i[0]]["name"] , suggestion: items[i[0]]["suggestion"], quantity_needed: items[i[0]]["quantityNeeded"])
    end
    if @event.save
      current_user.events << @event
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
