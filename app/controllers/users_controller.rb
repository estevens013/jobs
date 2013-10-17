class UsersController < ApplicationController
  before_filter :authorize
  
  def new
    @user = User.new
  end

  def index
  	@user = User.new
  	@users = User.all
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		# redirect_to root_url, :notice => "Signed up!"
      redirect_to users_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def edit
  	@user = User.find params[:id]
  end

  def update
  	user = User.find params[:id]
  	if user.update_attributes params[:user]
  		redirect_to users_path, :notice => 'Your User has successfully been updated'
  	else
  		redirect_to :back, :notice => 'There was an error updating your User'
  	end
  end

  def destroy
    User.destroy params[:id]
    redirect_to :back, :notice => 'User has been deleted'
  end

  private

    def user_params
      params.require(:user).permit(:username, :fullname, :email, :password, :password_confirmation, :customer, :admin)
    end

end
