class Job < ActiveRecord::Base
	has_many :parts
	has_many :documents

  attr_accessible :customer, :due, :internalOwner, :modified, :name, :owner, :purchaseOrder, :status, :invoicePaid
  validates :customer, :due, :internalOwner, :modified, :name, :owner, :purchaseOrder, :status, presence: true

  def self.search(search)
	  if search
	  	q = "%#{search}%"
	    # where 'id LIKE ? OR
	    # 				name LIKE ? OR 
	    # 				purchaseOrder LIKE ? OR
	    # 			 	customer LIKE ? OR 
	    # 			 	owner LIKE ? OR
	    # 			 	internalOwner LIKE ? OR
	    # 			 	status LIKE ?', 
	    # 			 	q, q, q, q, q, q, q
	    # Job.where(:id => q, :name => q, :purchaseOrder => q).joins(:parts).where("parts.partNumber = ?", q)
	    joins(:parts).where('jobs.id LIKE ? OR 
	    				jobs.name LIKE ? OR 
	    				jobs.purchaseOrder LIKE ? OR
	    			 	jobs.customer LIKE ? OR 
	    			 	jobs.owner LIKE ? OR
	    			 	jobs.internalOwner LIKE ? OR
	    			 	jobs.status LIKE ? OR
	    			 	parts.partNumber LIKE ?',
	    			 	q, q, q, q, q, q, q, q)
    else
	    # find(:all)
	    scoped
	  end
	end

end
