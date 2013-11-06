class Part < ActiveRecord::Base
	belongs_to :job

  attr_accessible :partNumber, :partQuantity, :job_id
  validates :partNumber, :partQuantity, :job_id, presence: true
end
