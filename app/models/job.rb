class Job < ActiveRecord::Base
  attr_accessible :customer, :due, :internalOwner, :modified, :name, :owner, :purchaseOrder, :status
  validates :customer, :due, :internalOwner, :modified, :name, :owner, :purchaseOrder, :status, presence: true
end
