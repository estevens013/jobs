class JobsController < ApplicationController
  #before_filter :authorize

  def index
    @job = Job.new
  	@jobs = Job.all
    @jobs = Job.order 'created_at DESC'
  end

  def create
  	@job = Job.new(params[:job])
  	if @job.save
  		redirect_to :back
  	end
  end

  def edit
    @job = Job.find params[:id]
  end

  def update
    job = Job.find params[:id]
    if job.update_attributes params[:job]
      redirect_to jobs_path, :notice => 'Your Job has successfully been updated'
    else
      redirect_to :back, :notice => 'There was an error updating your Job'
    end
  end

  def destroy
    Job.destroy params[:id]
    redirect_to :back, :notice => 'Job has been deleted'
  end

end
