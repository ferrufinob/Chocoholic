class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  
  private

  def current_user
    #look up the current user based on user_id in session cookie
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless current_user
      redirect_to root_url, alert: "You must be logged in to perform this action"
    end
  end

  def check_signed_in
    redirect_to chocolates_path if logged_in?
  end
end
