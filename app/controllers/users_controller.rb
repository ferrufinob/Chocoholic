class UsersController < ApplicationController
  before_action :check_signed_in, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), alert: "Account Successfully Created"
    else
      render :new
    end
  end

  def show
    @chocolates = current_user.chocolates.with_attached_image
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password
    )
  end
end
