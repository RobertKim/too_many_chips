class EventItem < ActiveRecord::Base
  attr_accessible :event_id, :description, :item_id, :quantity_needed
  
  # validates :quantity_needed, :presence => true, :message => "Please tell your guest how much you need."
  # validates :quantity_needed, :numericality => { 
  #   :only_integer => true 
  # }
  # validates :description, :length => {
  #   :maximum => 140,
  #   :too_long => "must be shorted thatn 140 characters."
  # }

  has_many :assigned_items
  belongs_to :event 
  belongs_to :item 
end
