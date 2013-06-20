class GuestsController < ApplicationController
  def new
    @guest = Guest.new
    @guest.assigned_items.build
    @assigned_item = AssignedItem.new
  end

  def create
    if @guest = Guest.find_by_email(params[:guest][:email])
      params["guest"]["assigned_items_attributes"].each do |e|
        @guest.assigned_items << AssignedItem.new(quantity_provided: e[1]["quantity_provided"], event_item_id: e[1]["event_item_id"])
      end
    else @guest = Guest.new(params[:guest])
    end
    if @guest.save
      session[:guest_id] = @guest.id
      @event = @guest.assigned_items.first.event_item.event
      render :json => event_path(@event).to_json
    else
      render :json => @guest.errors.full_messages.join(','), :status => :unprocessable_entity
    end
  end

  def rsvp
    puts "FFFFFF"
    p params[:url]
    @guest = Guest.find_by_url(params[:url])
    render :show
  end

  def show
    p params[:url]
    @guest = Guest.find_by_url(params[:url])
    render :show
  end
end

