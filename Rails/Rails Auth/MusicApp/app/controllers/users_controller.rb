class UsersController < ApplicationController
  before_action :ensure_logged_in_user, except: [:new, :create, :activate]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.generate_activation_token!
    if @user.save
      msg = UserMailer.activation_email(@user)
      msg.deliver_now
      flash[:notice] = "User '#{@user.email}' successfully added! Please check your email to activate your account."
      redirect_to new_session_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    if @user
      @user.toggle!(:activated)
      log_in_user!(@user)
      flash[:notice] = "User '#{@user.email}' successfully activated! Welcome to the site!"
      redirect_to user_url(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
