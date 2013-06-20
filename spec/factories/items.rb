FactoryGirl.define do
  factory :item do
    id                      1
    sequence(:name)        { |n| "stuff#{n}" }
    suggestion              "Eat it"
  end
end
