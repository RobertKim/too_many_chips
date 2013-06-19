class PagesController < ApplicationController

  def index
    @user = User.new
    @event = Event.new
    @event.event_items.build.item = Item.new
  end

end
