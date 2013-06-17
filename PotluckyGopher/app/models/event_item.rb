class EventItem < ActiveRecord::Base
  attr_accessible :event_id, :description, :item_id, :quantity_needed
  
  validates :quantity_needed, :presence => true#, :message => "Please tell your guest how much you need."
  validates :quantity_needed, :numericality => { 
    :only_integer => true 
  }
  validates :description, :length => {
    :maximum => 140,
    :too_long => "must be shorted thatn 140 characters."
  }
  
  has_many :assigned_items
  belongs_to :event 
  belongs_to :item 

  def quantity_still_needed
    provided_items = 0
    self.assigned_items.each do |item| 
      provided_items += item.quantity_provided 
    end
    return self.quantity_needed - provided_items
  end
end
