class Guest < ActiveRecord::Base
  has_many :assigned_items
end