FactoryBot.define do
  factory :user do
    name { 'Michael Kimura' }
    email { "michael@icloud.com" }
    password { "password" }
    password_confirmation { "password" }
    activated { true }
    activated_at { Time.zone.now }
  end
end
