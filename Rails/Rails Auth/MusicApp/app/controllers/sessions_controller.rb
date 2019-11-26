class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    log_in_user!(@user)
    redirect_to user_url(@user)
  end

  def destroy
    log_out!
    # redirect_to users_url
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end