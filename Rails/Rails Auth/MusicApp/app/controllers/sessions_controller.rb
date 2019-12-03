class SessionsController < ApplicationController
  before_action :ensure_logged_in_user, only: :destroy
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      if @user.activated
        flash[:notice] = "Successfully logged in! Welcome back, #{@user.email}"
        log_in_user!(@user)
        redirect_to user_url(@user)
      else
        flash[:errors] = Array.new
        flash[:errors] << "User '#{@user.email}' is not yet activated. Please click activation link in email"
        redirect_to new_session_url
      end
    else
      flash[:errors] = Array.new
      flash[:errors] << "Incorrect username and/or password"
      redirect_to new_session_url
    end
  end

  def destroy
    log_out!
    flash[:notice] = "Successfully logged out!"
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end