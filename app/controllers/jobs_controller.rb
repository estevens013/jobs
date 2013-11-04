class JobsController < ApplicationController
  # before_filter :authorize
  before_filter :access

  def index
   # @job  = Job.new
   # @jobs = Job.all
   # @jobs = Job.order 'id DESC'
   # @jobs = Job.where(:customer => current_user.customer).order 'id DESC'
   if current_user == nil
      redirect_to signin_path
    elsif current_user != nil
      if current_user.admin == "yes" || current_user.customer == "In Ternal"
        @jobs = Job.order 'id DESC'
        # true
        # redirect_to 'job_path'
      elsif current_user.admin == "no"
        @jobs = Job.where(:customer => current_user.customer).order 'id DESC'
        # false
        # render 'index'
      end
    end
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

  def show
    #@jobs = Job.search(params[:search]) 
    @job = Job.find params[:id]
  end

  def show_searched
    @jobs = Job.search(params[:search]) 
  end

  def show_completed
    @jobs = Job.where(:status => 'Completed').order 'id DESC'
  end

  def show_canceled
    @jobs = Job.where(:status => 'Canceled').order 'id DESC'
  end

  def show_declined
    @jobs = Job.where(:status => 'Declined').order 'id DESC'
  end

  # def view_job
  #   @job = Job.find params[:id]
  #   # job = Job.find params[:id]
  # end

end
