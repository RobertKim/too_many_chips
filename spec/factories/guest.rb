FactoryGirl.define do
  factory :guest do
    id                   1
    sequence(:email)    { |n| "Amy#{n}@gmail.com"}
    name                "Amy"
  end
end

