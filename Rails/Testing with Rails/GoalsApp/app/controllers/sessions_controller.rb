class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      log_in_user!(@user)
      redirect_to root_url
    else
      flash[:notice] = "User not found"
      redirect_to new_session_url
    end
  end

  def destroy
    log_out!
    flash[:notice] = "Successfully logged out"
    redirect_to root_url
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end