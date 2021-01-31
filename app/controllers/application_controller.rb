class ApplicationController < ActionController::Base
  helper_method :current_user

  protected

  def current_user
    #look up the current user based on user_id in session cookie
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    @current_user
  end

  def redirect_if_logged_in
    redirect_to login_path, alert: "You must be logged in to access this page." if !logged_in?
  end
end
