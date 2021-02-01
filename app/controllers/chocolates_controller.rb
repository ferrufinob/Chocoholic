class ChocolatesController < ApplicationController
  def index
    @chocolates = Chocolate.all
    @categories = Category.all
    # @chocolate.build_category
  end

  def new
    @chocolate = Chocolate.new
    @categories = Category.all
  end

  def create
    @chocolate = current_user.chocolates.build(chocolate_params)

    binding.pry

    if @chocolate.save
      redirect_to chocolates_path
    else
      render :new
    end
  end

  private

  def chocolate_params
    params.require(:chocolate).permit(
      :brand,
      :flavor,
      :cocoa,
      :country,
      :note,
      :category_id
    )
  end
end
