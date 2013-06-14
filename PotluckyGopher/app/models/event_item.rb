class EventItem < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :event 
  belongs_to :item 
end
