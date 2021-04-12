FactoryBot.define do
  factory :user do
    name { 'okutani' }
    sequence(:email) { |n| "okutani#{n}@example.com" }
    password { '1234abcd' }
    password_confirmation { '1234abcd' }
    confirmed_at { Time.current }
  end
end
