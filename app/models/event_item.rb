class EventItem < ActiveRecord::Base

  attr_accessible :event_id, :description, :item_id, :quantity_needed, :item_attributes

  validates :quantity_needed, :presence => true
  validates :quantity_needed, :numericality => {
    :only_integer => true,
    :greater_than_or_equal_to => 0
  }
  validates :description, :length => { :maximum => 140 }

  has_many :assigned_items
  belongs_to :event, :inverse_of => :event_items
  belongs_to :item, :inverse_of => :event_items

  accepts_nested_attributes_for :item

  def quantity_assigned
    self.assigned_items.map { |i| i.quantity_provided }.sum
  end

  def quantity_still_needed
    quant_needed = self.quantity_needed - self.quantity_assigned
    quant_needed >= 0 ? quant_needed : 0
  end

  def needed?
    self.quantity_needed > 0
  end

  def pecentage
    (self.quantity_assigned.to_f / self.quantity_needed.to_f).to_f * 100
  end
end

