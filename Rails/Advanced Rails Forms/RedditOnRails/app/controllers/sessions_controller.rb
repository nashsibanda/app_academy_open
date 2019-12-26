class SessionsController < ApplicationController
  before_action :ensure_logged_in, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:login][:name], params[:login][:password])
    if @user
      log_in_user!(@user)
      flash[:notice] = "Successfully logged in!"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "User not found"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    log_out!
    flash[:notice] = "Successfully logged out!"
    redirect_back(fallback_location: root_path)
  end
  
end