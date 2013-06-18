FactoryGirl.define do
  factory :item do
    sequence(:id)          { |n| n }
    sequence(:name)        { |n| "stuff#{n}" }
    suggestion            "Eat it"
  end
end
