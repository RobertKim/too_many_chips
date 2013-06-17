class EventItem < ActiveRecord::Base
  attr_accessible :event_id, :description, :item_id, :quantity_needed
  has_many :assigned_items
  belongs_to :event 
  belongs_to :item 
end
