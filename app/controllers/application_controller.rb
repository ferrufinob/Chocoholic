class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # rescue_from ActionController::InvalidAuthenticityToken, with: :rescue_422

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  helper_method :current_user, :logged_in?

  protected

  def current_user
    #look up the current user based on user_id in session cookie
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def rescue_422
    redirect_to "/422"
  end
end
