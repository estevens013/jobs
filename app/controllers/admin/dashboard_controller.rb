class Admin::DashboardController < ApplicationController
	before_filter :authorize

  def index
  end

  def show
    #@jobs = Job.search(params[:search]) 
  end

end
