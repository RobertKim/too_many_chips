class AssignedItemsController < ApplicationController

def create
  p @event
  p params
  @assigned_item = AssignedItem.new(params[:assigned_item])
  if @assigned_item.save
    p "worked!!!!!!!!!!!!!!!!!!!!!!"
  else
    p "didn't :((((((((((:((((((((((:((((((((((:(((((((((("
  end
end

end
