class ReviewsController < ApplicationController
  authorize_resource
  before_action :set_review, only: [:edit, :update, :show, :destroy]
  before_action :set_chocolate, only: [:new, :create]

  def index
  end

  def show
  end

  def new
    if @chocolate
      @review = @chocolate.reviews.build
    else
      redirect_to root_path, alert: "Oops that Chocolate doesn't exist"
    end
  end

  def create
    @review = @chocolate.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to chocolate_path(@review.chocolate)
    else
      render :new
    end
  end

  def destroy
    if @review.destroy
      redirect_to root_path
    end
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

  def set_chocolate
    @chocolate = Chocolate.find_by_id(params[:chocolate_id])
  end
end
