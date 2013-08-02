class Event < ActiveRecord::Base

  validates :name, :presence => true
  before_save :set_url

  attr_accessible :date, :description, :name,
    :host_provided, :location, :name, :start_time, :user_id,
    :event_items_attributes

  belongs_to :user
  has_many :event_items, :inverse_of => :event, :dependent => :destroy
  has_many :items, :through => :event_items
  has_many :assigned_items, :through => :event_items, :dependent => :destroy

  accepts_nested_attributes_for :event_items, :reject_if => :all_blank, :allow_destroy => true
  def set_url
    self.url ||= SecureRandom.urlsafe_base64
  end

  def upcoming?
    self.date  > DateTime.now
  end

  def past?
    self.date  <= DateTime.now
  end

  def guests
    self.assigned_items.map {|item| (item.guest) }.uniq
  end

end
