class PartsController < ApplicationController

	def index
  	@part = Part.new
  	@parts = Part.all
  end

  def create
  	# ###For assocations###
  	# @part = current_job.parts.build(params[:part])
  	@part = Part.new(params[:part])
  	if @part.save
  		redirect_to :back
  	end
  end

  def edit
  	@part = Part.find params[:id]
  end

  def update
  	part = Part.find params[:id]
  	if part.update_attributes params[:part]
  		redirect_to parts_path, :notice => 'Your Part has successfully been updated'
  	else
  		redirect_to :back, :notice => 'There was an error updating your Part'
  	end
  end

  def destroy
  	Part.destroy params[:id]
  	redirect_to :back, :notice => 'Part has been deleted'
  end

  def show
    @part = Part.find params[:id]
  end

end
