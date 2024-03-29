FactoryBot.define do
  factory :user do
    name { 'Michael Kimura' }
    sequence(:email) { |n| "michael#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    activated { true }
    activated_at { Time.zone.now }
    admin { false }
  end
end
