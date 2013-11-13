class Document < ActiveRecord::Base
	belongs_to :job

  attr_accessible :documentDescription, :documentName, :documentSize, :documentType
  validates :job_id, :documentName, :documentSize, :documentType, presence: true
end
