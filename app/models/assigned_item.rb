class AssignedItem < ActiveRecord::Base
  attr_accessible :event_item_id, :quantity_provided, :guest_id
  validates :quantity_provided, :presence => true
  validates :quantity_provided, :numericality => {:only_integer => true, :greater_than => 0}
  belongs_to :event_item
  belongs_to :user
  def find_all_user_items #this name isn't very descriptive.
    AssignedItem.where('guest_email=?', self.guest_email)
  end

end
