class AssignedItem < ActiveRecord::Base
  attr_accessible :event_item_id, :quantity_provided, :guest_email, :guest_name, :url

  validates :quantity_provided, :presence => true, :numericality => {:only_integer => true, :greater_than => 0}
  validates :guest_name, :presence => true#, :message => "Please let your friend know who you are."
  validates :guest_email, :format => {:with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
  belongs_to :event_item

end
