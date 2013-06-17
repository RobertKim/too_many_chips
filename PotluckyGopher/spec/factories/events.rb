FactoryGirl.define do
  factory :event do
    name         "bbq"
    description  "Super fun"
    date         "tomorrow"
    location     "DBC"
    url          rand(1500000).to_s
  end
end
