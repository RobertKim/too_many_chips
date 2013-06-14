class Item < ActiveRecord::Base
  attr_accessible :event_id, :name, :suggestion

  belongs_to :event

  has_many :event_items
  has_many :events, :through => :event_items
  
end
