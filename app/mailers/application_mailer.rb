class ApplicationMailer < ActionMailer::Base
  default from: CUSTOM_ENV[:sender_email]
  layout 'mailer'
end
