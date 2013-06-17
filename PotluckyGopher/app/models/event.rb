class Event < ActiveRecord::Base
  attr_accessible :date, :description, :end_time, :name, 
    :host_provided, :location, :name, :start_time, :url, :user_id, 
    :event_items_attributes #, :items_attributes

  belongs_to :user
  has_many :event_items, :inverse_of => :event
  has_many :items, :through => :event_items

  accepts_nested_attributes_for :event_items, :reject_if => :all_blank, :allow_destroy => true
  # accepts_nested_attributes_for :items
end
