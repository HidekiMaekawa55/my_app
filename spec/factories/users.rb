FactoryBot.define do
  factory :user do
    name { 'Michael Kimura' }
    email { "michael@icloud.com" }
    password_digest { User.digest('password') }
    activated { true }
    activated_at { Time.zone.now }
  end
end
