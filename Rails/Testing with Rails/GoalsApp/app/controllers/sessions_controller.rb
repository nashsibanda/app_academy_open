class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      log_in_user!(@user)
    else
      
    end
  end

  def destroy
  
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
  
end