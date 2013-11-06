class Job < ActiveRecord::Base
	has_many :parts

  attr_accessible :customer, :due, :internalOwner, :modified, :name, :owner, :purchaseOrder, :status
  validates :customer, :due, :internalOwner, :modified, :name, :owner, :purchaseOrder, :status, presence: true

  def self.search(search)
	  if search
	    # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	    where 'id LIKE ? OR 
	    				name LIKE ? OR 
	    				purchaseOrder LIKE ? OR
	    			 	customer LIKE ? OR 
	    			 	owner LIKE ? OR
	    			 	internalOwner LIKE ? OR
	    			 	status LIKE ?', 
	    			 	"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"
	    			 # :due, :internalOwner, :modified, :status
	  else
	    # find(:all)
	    scoped
	  end
	end

end
