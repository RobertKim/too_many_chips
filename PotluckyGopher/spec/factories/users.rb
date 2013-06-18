FactoryGirl.define do
  factory :user do
    name            "Ben Angel"
    sequence(:email)   { |n| "test#{n}@testy.com"}
    password_digest "password"
  end
end
