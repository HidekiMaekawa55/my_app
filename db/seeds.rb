User.create!(name:  "Example User",
             email: "example@example.com",
             password:              "password",
             password_confirmation: "password",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
             
10.times do             
    Manuscript.create!(title: "Example",
                       content: "example,example,example,example")
end