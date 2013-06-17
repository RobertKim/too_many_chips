FactoryGirl.define do
  factory :user do
    name            "Ben Angel"
    email           20.times do i+= 1 "Ben@Ben#{i}.com" end
    password_digest "password"
  end
end
