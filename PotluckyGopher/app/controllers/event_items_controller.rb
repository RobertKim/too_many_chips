class EventItemsController < ApplicationController
  # GET /event_items
  # GET /event_items.json
  def index
    @event_items = EventItem.all
  end

  # GET /event_items/1
  # GET /event_items/1.json
  def show
    @event_item = EventItem.find(params[:id])
  end

  # GET /event_items/new
  # GET /event_items/new.json
  def new
    @event_item = EventItem.new
  end

  # GET /event_items/1/edit
  def edit
    @event_item = EventItem.find(params[:id])
  end

  # POST /event_items
  # POST /event_items.json
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

  # PUT /event_items/1
  # PUT /event_items/1.json
  def update
    @event_item = EventItem.find(params[:id])
    end
  end

  # DELETE /event_items/1
  # DELETE /event_items/1.json
  def destroy
    @event_item = EventItem.find(params[:id])
    @event_item.destroy

    respond_to do |format|
      format.html { redirect_to event_items_url }
      format.json { head :no_content }
    end
  end
end
