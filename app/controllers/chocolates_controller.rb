class ChocolatesController < ApplicationController
  def index
    #checking if nested and if we can find that chocolate
    if params[:category_id] && @category = Category.find_by_id(params[:category_id])
      #show all the chocolates that are a part of the category
      @chocolates = @category.chocolates
    else
      @chocolates = Chocolate.all
    end
  end

  def new
    @chocolate = Chocolate.new
    @categories = Category.all
    @chocolate.build_category
  end

  def create
    @chocolate = current_user.chocolates.build(chocolate_params)
    if @chocolate.save
      redirect_to chocolates_path
    else
      render :new
    end
  end

  def show
    @chocolate = Chocolate.find_by_id(params[:id])
  end

  private

  def chocolate_params
    params.require(:chocolate).permit(
      :brand,
      :flavor,
      :cocoa,
      :country,
      :note,
      :category_id,
      category_attributes: [:name],
    )
  end
end
