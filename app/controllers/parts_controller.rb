class PartsController < ApplicationController
	before_filter :authorize

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
    session[:return_to] ||= request.referer
  end

  def update
  	part = Part.find params[:id]
    # job = Part.find params[:job_id, :value => @job.id]
    # @job = Part.jobs.new(params[:job])
    # @parts = @job.parts
  	if part.update_attributes params[:part]
  		# redirect_to jobs_path, :notice => 'Your Part has successfully been updated'
      # redirect_to jobs_path(:value => @job.id), :notice => 'Your Part has successfully been updated'

      # ##### Functioning, but not how I want.  Redirects back to Part view ##### #
      redirect_to session.delete(:return_to), :notice => 'Your Part has successfully been updated'
      # redirect_to job(@job)
      # <%= form_for @job.parts.create do |f| %>
      # <%= f.hidden_field :job_id, :value => @job.id %>
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
