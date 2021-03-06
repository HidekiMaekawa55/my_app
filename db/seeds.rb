User.create!(name:  "Example User",
             email: "example@example.com",
             password:              "password",
             password_confirmation: "password",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
