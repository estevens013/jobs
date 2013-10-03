class User < ActiveRecord::Base
  attr_accessible :admin, :customer, :email, :fullname, :username, :password, :password_confirmation
  attr_accessor :password, :password_confirmation
  
  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :admin, :customer, :fullname, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, 
  						format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false } 
  # has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates_confirmation_of :password
end
