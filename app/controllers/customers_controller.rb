class CustomersController < ApplicationController
  before_filter :authorize

  def index
  	@customer = Customer.new
  	@customers = Customer.all
  end

  def create
  	@customer = Customer.new(params[:customer])
  	if @customer.save
  		redirect_to :back
  	end
  end

  def edit 
  	@customer = Customer.find params[:id]
  end

  def update
  	customer = Customer.find params[:id]
  	if customer.update_attributes params[:customer]
  		redirect_to customers_path, :notice => 'Your Customer has successfully been updated'
  	else
  		redirect_to :back, :notice => 'There was an error updating your Customer'
  	end
  end

  def destroy
  	Customer.destroy params[:id]
  	redirect_to :back, :notice => 'Customer has been deleted'
  end

end
