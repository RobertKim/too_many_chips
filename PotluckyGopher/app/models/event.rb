class Event < ActiveRecord::Base
  attr_accessible :date, :description, :end_time, :host_provided, :location, :name, :start_time, :url, :user_id, :items_attributes

  belongs_to :user
  has_many :event_items
  has_many :items, :through => :event_items

  accepts_nested_attributes_for :items, :reject_if => :all_blank, :allow_destroy => true
end
