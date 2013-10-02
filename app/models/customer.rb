class Customer < ActiveRecord::Base
  attr_accessible :customername
  validates :customername, presence: true
end
