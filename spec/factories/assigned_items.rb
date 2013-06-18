FactoryGirl.define do
  factory :assigned_item do
    event_item_id             1
    quantity_provided         2
    sequence(:guest_email)   { |n| "ben@ben#{n}.com" }
    sequence(:guest_name)    { |n| "Robert#{n}"}
  end
end

