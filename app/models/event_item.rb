class EventItem < ActiveRecord::Base
  after_save :check_nil
  attr_accessible :event_id, :description, :item_id, :quantity_needed, :item_attributes

  validates :description, :length => { :maximum => 140 }

  has_many :assigned_items ,:dependent => :destroy
  belongs_to :event, :inverse_of => :event_items
  belongs_to :item, :inverse_of => :event_items

  accepts_nested_attributes_for :item, :reject_if => :all_blank

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

  def set_quantity
    if self.quantity_needed == nil || self.quantity_needed <= 0
      self.quantity_needed = 1
      self.save
    end
  end

  def check_nil
    if self.item_id == nil
      self.destroy 
    else
      set_quantity
    end
  end

end


