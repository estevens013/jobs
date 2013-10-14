class SessionsController < ApplicationController
	def new
	end

	# def create
	#   user = User.authenticate(params[:email], params[:password])
	#   if user
	#     session[:user_id] = user.id
	#     redirect_to root_url, :notice => "Logged in!"
	#   else
	#     flash.now.alert = "Invalid email or password"
	#     render "new"
	# 	end
	# end
	def create
		# flash.now.alert = "Testing I"
		user = User.find_by_email(params[:session][:email])
		# flash.now.alert = "Testing II"
		if user && user.authenticate(params[:session][:password])
		  # Sign the user in and redirect to the user's show page.
		  session[:user_id] = user.id
	  	redirect_to root_url, :notice => "Logged in!"
		else
		  # Create an error message and re-render the signin form.
		  flash.now.alert = "Invalid email or password"
	  	render "new"
		end
	end

	# def create
	# 	user = User.authenticate(
	# 		params[:session][:email], 
	# 		params[:session][:password]
	# 	)

	# 	if session[:user_id] = user.id
	#   	redirect_to root_url, :notice => "Logged in!"
	# 	else
	# 	  # Create an error message and re-render the signin form.
	# 	  flash.now.alert = "Invalid email or password"
	#   	render "new"
	# 	end
	# end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end
end
