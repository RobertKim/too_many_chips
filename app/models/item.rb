class Item < ActiveRecord::Base
  attr_accessible :event_id, :name, :suggestion, :quantity_needed, :event_items_attributes
  
  has_many :items, :through => :event_items
  has_many :events, :through => :event_items #:inverse_of => :item
  has_many :event_items, :inverse_of => :item
  
  accepts_nested_attributes_for :event_items, :allow_destroy => true
end
