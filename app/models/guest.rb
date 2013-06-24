class Guest < ActiveRecord::Base
  before_save :set_url
  has_many :assigned_items, :dependent => :destroy
  has_many :event_items, :through => :assigned_items
  attr_accessible :name, :email, :url, :guest_id, :assigned_items_attributes

  accepts_nested_attributes_for :assigned_items

  def contributions(id)
    self.assigned_items.select { |item| item if (item.event_item.event_id == id) }
  end

  def set_url
    self.url ||= SecureRandom.urlsafe_base64
  end

end
