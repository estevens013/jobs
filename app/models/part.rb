class Part < ActiveRecord::Base
  attr_accessible :partNumber, :partQuantity, :job_id
  validates :partNumber, :partQuantity, :job_id, presence: true
end
