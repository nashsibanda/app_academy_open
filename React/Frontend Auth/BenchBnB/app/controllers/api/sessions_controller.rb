# frozen_string_literal: true

class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      render json: ['Username or password is wrong!'], status: 401
    else
      login!(@user)
      redirect_to api_user_url(@user)
    end
  end

  def destroy
    logout!
    render json: { message: 'Successfully logged out' }
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
