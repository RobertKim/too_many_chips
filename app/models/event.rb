class Event < ActiveRecord::Base

  validates :name, :presence => true
  before_save :set_url

  attr_accessible :date, :description, :name,
    :host_provided, :location, :name, :start_time, :user_id,
    :event_items_attributes

  belongs_to :user
  has_many :event_items, :inverse_of => :event
  has_many :items, :through => :event_items

  accepts_nested_attributes_for :event_items, :reject_if => :all_blank, :allow_destroy => true

  def set_url
    self.url ||= SecureRandom.urlsafe_base64
  end

  def upcoming?
    self.date  > DateTime.now
  end

  def past?
    self.date  < DateTime.now
  end
end