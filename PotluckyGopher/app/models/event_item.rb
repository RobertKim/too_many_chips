class EventItem < ActiveRecord::Base

attr_accessible :event_id, :description, :item_id, :quantity_needed, :item_attributes

  validates :quantity_needed, :presence => true#, :message => "Please tell your guest how much you need."
  validates :quantity_needed, :numericality => {
    :only_integer => true,
    :greater_than_or_equal_to => 0
  }
  validates :description, :length => { :maximum => 140 }

  has_many :assigned_items
  belongs_to :event, :inverse_of => :event_items
  belongs_to :item, :inverse_of => :event_items

  accepts_nested_attributes_for :item
 

  def quantity_assigned
    AssignedItem.find_all_by_event_item_id(self.id).map { |i| i.quantity_provided}.sum
  end

  def quantity_still_needed
     self.quantity_needed - self.quantity_assigned
  end

  def needed?
   quantity_still_needed > 0
  end
end

