class SessionsController < ApplicationController
  before_action :already_signed_in, except: :destroy
  
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
    redirect_to new_session_url
  end

  private
  def already_signed_in
    if !current_user.nil?
      redirect_to cats_url
    end
  end
  
end