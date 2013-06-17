class EventItem < ActiveRecord::Base
  attr_accessible :event_id, :description, :item_id, :quantity_needed, :_destroy
  before_create :valid_quantity?

  validates :quantity_needed, :presence => true#, :message => "Please tell your guest how much you need."
  validates :quantity_needed, :numericality => {
    :only_integer => true,
    :greater_than_or_equal_to => 0
  }
  validates :description, :length => { :maximum => 140 }

  validates :guest_email, :format => {:with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}

  has_many :assigned_items
  belongs_to :event, :inverse_of => :event_items
  belongs_to :item, :inverse_of => :event_items

  def valid_quantity?
    raise TypeError unless quantity_needed.class == Integer
  end

  def quantity_still_needed
    provided_items = 0
    self.assigned_items.each do |item|
      provided_items += item.quantity_provided
    end
    quant_needed = self.quantity_needed - provided_items
    quant_needed >= 0 ? quant_needed : 0
  end

  def update_quant_needed
    self.update_attribute("quantity_needed", self.quantity_still_needed)
  end

  def needed?
   quantity_still_needed > 0
  end
end
