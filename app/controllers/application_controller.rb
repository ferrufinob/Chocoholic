class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  #if they are changing url in developer tools, don't display the invalid authenticity token page
  #display error message.
  # rescue_from ActionController::InvalidAuthenticityToken do |_exception|
  #   redirect_back fallback_location: root_path, alert: "Invalid Action"
  # end

  protected

  def current_user
    #look up the current user based on user_id in session cookie
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless current_user
      flash[:message] = "You must be logged in"
      redirect_to root_url
    end
  end

  def check_signed_in
    redirect_to chocolates_path if logged_in?
  end
end
