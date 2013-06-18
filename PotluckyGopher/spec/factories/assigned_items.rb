FactoryGirl.define do
  factory :assigned_item do
    sequence(:event_item_id) { |n| n }
    quantity_provided         2
    sequence(:guest_email)   { |n| "ben@ben#{n}.com" }
    sequence(:guest_name)    { |n| "Robert#{n}"}
  end
end

