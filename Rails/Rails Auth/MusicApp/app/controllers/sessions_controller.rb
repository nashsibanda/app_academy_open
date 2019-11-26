class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(session_params)
    log_in_user!(@user)
    redirect_to user_url(current_user)
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