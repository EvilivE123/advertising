class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_credentials.subject
  #
  def send_credentials_before_registration(user)
  	@user = user
  	mail(to: ENV['SENDER_EMAIL'], subject: 'AdvertisingManagement - New Member Registration')
  end

  def send_credentials_before_password_reset(user)
  	@user = user
  	mail(to: ENV['SENDER_EMAIL'], subject: 'AdvertisingManagement - Password Reset By Member')
  end

  def send_booked_slot_mail_to_orgainzation(user, booked_slot)
    @booked_slot = booked_slot
    @user = user
    mail(from: ENV['SENDER_EMAIL'], to: @user.email, subject: 'AdvertisingManagement - Slot Booked Successfully')  
  end

  def send_booked_slot_mail_to_agent(user, booked_slot)
    @booked_slot = booked_slot
    @user = user
    mail(from: ENV['SENDER_EMAIL'], to: @user.email, subject: 'AdvertisingManagement - Slot Booked Successfully')    
  end
end
