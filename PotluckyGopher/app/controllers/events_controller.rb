class EventsController < ApplicationController
  respond_to :json, :html
  before_filter :logged_in?
  # before_filter :check_permissions, :only => [:show, :destroy]

  def show
    @event = Event.find(params[:id])
    session[:event_id] = @event.id
    @assigned_item = AssignedItem.new
  end

  def new
    @event = Event.new
    @event.event_items.build.item = Item.new
  end

  def edit
    @event = Event.find(params[:id])
  end
<<<<<<< HEAD

=======
>>>>>>> 2b726ee80530ce6b2fcf81567bae7236c3b5b385

  def create
    @event = Event.new(params[:event])
    @event.url = SecureRandom.urlsafe_base64
    @event.user_id = current_user.id
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
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.xml  { head :ok }
    end
  end

  def invitation
    @event = Event.find_by_url(params[:id])
  end

  def edit_bringing
  
  end



 private 

  def check_permissions
    current_user.id == @event.user.id
  end
  
  def logged_in?
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end
end

