class SessionsController < ApplicationController
  def welcome
  end

  def new
    if logged_in?
      redirect_to chocolates_path
    end
  end

  def create
    #find user & autheticate
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
end
