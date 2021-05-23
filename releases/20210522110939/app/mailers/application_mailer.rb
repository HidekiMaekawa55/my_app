class ApplicationMailer < ActionMailer::Base
  default from: "manager@njs.com"
  layout 'mailer'
end
