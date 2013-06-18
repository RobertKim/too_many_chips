FactoryGirl.define do
  factory :event do
    sequence(:name)  { |n| "bbq#{n}" }
    description       "Super fun"
    date              "tomorrow"
    location          "DBC"
  end
end
