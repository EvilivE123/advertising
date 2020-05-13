class User < ApplicationRecord
  include Pacecar
  # Include default devise modules. Others available are:

  devise :database_authenticatable, :registerable, :recoverable, :validatable

  validates_presence_of :name
  validates_presence_of :type
  validates_length_of :password, minimum: 6

  before_create :send_credentials
  
  def send_credentials
  	UserMailer.send_credentials_before_registration(self).deliver_now
  end

end
