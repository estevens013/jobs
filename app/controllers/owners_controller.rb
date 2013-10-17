class OwnersController < ApplicationController
  before_filter :authorize
  
  def index
  	@owner = Owner.new
  	@owners = Owner.all
  end

  def create
  	@owner = Owner.new(params[:owner])
  	if @owner.save
  		redirect_to :back
  	end
  end

  def edit
  	@owner = Owner.find params[:id]
  end

  def update
  	owner = Owner.find params[:id]
  	if owner.update_attributes params[:owner]
  		redirect_to owners_path, :notice => 'Your Owner has successfully been updated'
  	else
  		redirect_to :back, :notice => 'There was an error updating your Owner'
  	end
  end

  def destroy
  	Owner.destroy params[:id]
  	redirect_to :back, :notice => 'Owner has been deleted'
  end

end
