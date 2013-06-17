class EventItemsController < ApplicationController
  def index
    @event_items = EventItem.all
  end

  def show
    @event_item = EventItem.find(params[:id])
  end

  def new
    @event_item = EventItem.new
  end

  def edit
    @event_item = EventItem.find(params[:id])
  end

  # def create
  #   @event_item = EventItem.new(params[:event_item])

  #   respond_to do |format|
  #     if @event_item.save
  #       puts "THE CONTROLLERS EVENT ITEM!!!!!!!!!!!!!!"
  #       puts @event_item
  #       format.html { redirect_to @event_item, notice: 'Event item was successfully created.' }
  #       format.json { render json: @event_item, status: :created, location: @event_item }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @event_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    @event_item = EventItem.find(params[:id])

  end

  def destroy
    @event_item = EventItem.find(params[:id])
    @event_item.destroy
  end
end
