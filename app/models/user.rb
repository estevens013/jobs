class User < ActiveRecord::Base
  attr_accessible :admin, :customer, :email, :fullname, :username
  validates :admin, :customer, :email, :fullname, :username, presence: true
end
