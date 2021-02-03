class ReviewsController < ApplicationController
  authorize_resource
  before_action :set_review, only: [:edit, :update, :show, :destroy]

  def index
    #if nested
    if params[:chocolate_id] && @chocolate = Chocolate.find_by_id(params[:chocolate_id])
      @reviews = @chocolate.reviews
    else
      @reviews = current_user.reviews #otherwise show users if user clicks view all link
    end
  end

  def show
  end

  def new
    if @chocolate = Chocolate.find_by_id(params[:chocolate_id])
      @review = @chocolate.reviews.build
    else
      redirect_to root_path, alert: "Oops that Chocolate doesn't exist"
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

  def destroy
    @review.destroy
    redirect_to chocolates_path, alert: "Successfully Deleted Comment"
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
end
