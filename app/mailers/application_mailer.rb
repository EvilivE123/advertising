class ApplicationMailer < ActionMailer::Base
  default from: ENV['sender_email']
  layout 'mailer'
end
