class ReviewsController < ApplicationController
  def index
  end

  def show
    # @chocolate = Chocolate.find(params[:chocolate_id])
    # @reviews = @chocolate.reviews
  end

  def new
    # if user changes parameters in developers tool they get Unpermitter parameter
    if params[:chocolate_id] && !Chocolate.exists?(params[:chocolate_id])
      redirect_to root_path
    else
      @review = Review.new(chocolate_id: params[:chocolate_id])
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to chocolate_path(@review.chocolate)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :comment,
      :chocolate_id
    )
  end

  
end
