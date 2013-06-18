class Event < ActiveRecord::Base

  validates :name, :presence => true
  before_save :set_url
  attr_accessible :name, :date, :description, :host_provided,
    :location, :url, :user_id, :event_items_attributes #, :items_attributes

  belongs_to :user
  has_many :event_items, :inverse_of => :event
  has_many :items, :through => :event_items

  accepts_nested_attributes_for :event_items, :reject_if => :all_blank, :allow_destroy => true
  # accepts_nested_attributes_for :items
  def set_url
    self.url ||= SecureRandom.urlsafe_base64
  end

end
