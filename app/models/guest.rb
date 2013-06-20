class Guest < ActiveRecord::Base
  has_many :assigned_items
  has_many :event_items, :through => :assigned_items
  attr_accessible :name, :email, :url, :guest_id, :assigned_items_attributes

  accepts_nested_attributes_for :assigned_items

  def contributions(id)
    self.assigned_items.select { |item| item if (item.event_item.event_id == id) }
  end

end
