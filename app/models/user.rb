class User < ApplicationRecord
  # Include default devise modules. Others available are:

  devise :database_authenticatable, :registerable, :recoverable, :validatable

  validates_presence_of :name
  validates_presence_of :type
  validates_length_of :password, minimum: 6
end
