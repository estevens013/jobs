class Owner < ActiveRecord::Base
  attr_accessible :ownername
  validates :ownername, presence: true
end
