class ApplicationController < ActionController::Base
  helper_method :current_user

  def log_in_user!(user)
    user.reset_session_token!
    user.save
    session[:session_token] = user.session_token
  end

  def log_out!
    session[:session_token] = nil
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_logged_in
    if current_user.nil?
      flash[:error] = "You must be logged in to perform this action..."
      redirect_to new_session_url
    end
  end

end
