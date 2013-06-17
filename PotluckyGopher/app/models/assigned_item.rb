class AssignedItem < ActiveRecord::Base
  attr_accessible :event_item_id, :quantity_provided, :guest_email, :guest_name, :url

  belongs_to :event_items
  belongs_to :event
end
