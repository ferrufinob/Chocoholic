class ReviewsController < ApplicationController
  before_action :require_login
  before_action :set_review, only: [:edit, :update, :show, :destroy]
  before_action :authorized_to_edit, only: [:edit, :update]

  def index
    if params[:chocolate_id] && @chocolate = Chocolate.find_by_id(params[:chocolate_id])
      @reviews = @chocolate.reviews.by_created_at
    elsif params[:user_id] && @user = User.find_by_id(params[:user_id])
      @reviews = @user.reviews.by_created_at
    else
      @reviews = current_user.reviews.by_created_at
    end
  end

  def show
  end

  def new
    if params[:chocolate_id] && !Chocolate.exists?(params[:chocolate_id])
      redirect_to chocolates_path, alert: "Chocolate not found."
    else
      @chocolate = Chocolate.find_by_id(params[:chocolate_id])
      @review = @chocolate.reviews.build
    end
  end

  def create
    @chocolate = Chocolate.find_by_id(params[:chocolate_id])
    @review = @chocolate.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to chocolate_path(@review.chocolate)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to chocolate_path(@review.chocolate)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to chocolate_path(@review.chocolate), alert: "Successfully Deleted Comment"
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :comment
    )
  end

  def set_review
    @review = Review.find_by_id(params[:id])
  end

  def authorized_to_edit
    if current_user != @review.user
      flash[:message] = "Action not authorized."
      redirect_to chocolates_path
    end
  end
end
