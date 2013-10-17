class ApplicationController < ActionController::Base
  protect_from_forgery
  # include SessionsHelper
  helper_method :current_user
  helper_method :admin?

  protected

  def authorize
  	unless admin?
  		flash[:error] = "Unauthorized access"
  		redirect_to jobs_path
  		false
  	end
  end

  def admin?
  	if current_user == nil
  		#flash[:error] = "Nil current_user"
  		#redirect_to signin_path
  	elsif current_user != nil
  		#flash[:error] = "current_user signed in"
  		# redirect_to jobs_path
  		if current_user.admin == "yes"
	  		true
	  	elsif current_user.admin == "no"
	  		false
	  	end
	 	end
  end

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
