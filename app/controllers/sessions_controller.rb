class SessionsController < ApplicationController
  before_action :check_signed_in, only: [:welcome, :new]

  def welcome
  end

  def new
  end

  def google
    user = User.from_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to login_path
    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user), alert: "Successful log in"
    else
      redirect_to login_path, alert: "Email and Password Don't Match"
    end
  end

  def destroy
    #delete the saved user_id key/value from the cookie
    session.delete(:user_id)
    redirect_to login_path, alert: "Successfully Signed Out"
  end

  private

  def auth
    request.env["omniauth.auth"]
  end
end
