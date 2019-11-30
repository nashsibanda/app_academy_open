class ApplicationController < ActionController::Base
  helper_method :current_user

  def log_in_user!(user)
    user.reset_session_token!
    user.save
    session[:session_token] = user.session_token
  end

  def logged_in?
    session[:session_token] == current_user.session_token
  end

  def log_out!
    session[:session_token] = nil
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_logged_in_user
    redirect_to new_session_url if current_user.nil?
  end
end
