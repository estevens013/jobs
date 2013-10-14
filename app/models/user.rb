class User < ActiveRecord::Base
  attr_accessible :admin, :customer, :email, :fullname, :username, :password, :password_confirmation
  has_secure_password
  # attr_accessor :password, :password_confirmation, :password_salt
  # attr_accessor :password_confirmation
  before_save { username.downcase! }
  before_save { email.downcase! }
  before_save :encrypt_password

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

	def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    # if user && user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
