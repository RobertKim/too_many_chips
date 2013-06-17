class AssignedItem < ActiveRecord::Base
  attr_accessible :event_item_id, :quantity_provided, :guest_email, :guest_name, :url

  # validates :quantity_provided, :presence => true, :numericality => {:only_integer => true}, :message
  # validates :guest_name, :presence => true, :message => "Please let your friend know who you are."
  belongs_to :event_items
  belongs_to :event
end
