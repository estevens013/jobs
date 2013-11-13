class Part < ActiveRecord::Base
	belongs_to :job

  attr_accessible :partNumber, :partQuantity, :job_id, :partRev, :partSerial, :partVendorDue, :partStatus, :partShipDate, :partTracking
  validates :partNumber, :partQuantity, :job_id, presence: true
end
