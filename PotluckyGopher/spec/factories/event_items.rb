FactoryGirl.define do
  factory :event_item do
    sequence(:event_id)       {|n| n }
    description               "cold"
    sequence(:item_id)         {|n| n }
    quantity_needed            2
  end
end
