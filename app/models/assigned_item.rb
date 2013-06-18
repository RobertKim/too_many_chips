class AssignedItem < ActiveRecord::Base
  attr_accessible :event_item_id, :quantity_provided, :guest_email, :guest_name, :url

  validates :quantity_provided, :presence => true
  validates :quantity_provided, :numericality => {:only_integer => true, :greater_than => 0}
  validates :guest_name, :presence => true#, :message => "Please let your friend know who you are."
  validates :guest_email, :format => {:with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
  belongs_to :event_item

  def find_all_user_items #this name isn't very descriptive.
    AssignedItem.find_all_by_guest_email(self.guest_email)
  end

end
