FactoryGirl.define do
  factory :event do
    sequence(:name)  { |n| "bbq#{n}" }
    description       "Super fun"
    date              "tomorrow"
    location          "DBC"
    url              { |n| "0000#{n}" }
  end
end
