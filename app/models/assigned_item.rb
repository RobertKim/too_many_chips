class AssignedItem < ActiveRecord::Base
  attr_accessible :event_item_id, :quantity_provided, :guest_id
  validates :quantity_provided, :presence => true
  validates :quantity_provided, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  belongs_to :event_item
  belongs_to :guest
  has_many :assigned_items, :through => :event_items

  after_create :delete_if_zero

  def find_all_user_items #this name isn't very descriptive.
    AssignedItem.where('guest_email=?', self.guest_email)
  end
  def delete_if_zero
    self.destroy if self.quantity_provided == 0
  end
end
