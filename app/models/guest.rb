class Guest < ActiveRecord::Base
  has_many :assigned_items
  attr_accessible :name, :email, :url, :guest_id, :assigned_items_attributes

  accepts_nested_attributes_for :assigned_items
end
