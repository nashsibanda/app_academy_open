class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      render json: "Credentials were wrong"
    else
      login!(user)
      redirect_to cats_url
    end
  end

  def destroy
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end
  
end