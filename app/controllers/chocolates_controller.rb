class ChocolatesController < ApplicationController
  load_and_authorize_resource
  # before_action :set_chocolate, only: [:edit, :update, :show, :destroy]

  def index
    #checking if nested and if we can find that chocolate
    if params[:category_id] && @category = Category.find_by_id(params[:category_id])
      #show all the chocolates that are a part of the category
      @chocolates = @category.chocolates
    else
      @chocolates = Chocolate.all
    end
  end

  def show
  end

  def new
    # @chocolate = Chocolate.new
    @chocolate.build_category
  end

  def create
    @chocolate = current_user.chocolates.build(chocolate_params)
    if @chocolate.save
      redirect_to chocolate_path(@chocolate)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chocolate.update(chocolate_params)
      redirect_to chocolate_path(@chocolate)
    else
      render "edit"
    end
  end

  def destroy
    if @chocolate.destroy
      redirect_to chocolates_url
    else
      redirect_to chocolates_url
    end
  end

  private

  def chocolate_params
    params.require(:chocolate).permit(
      :brand,
      :flavor,
      :cocoa,
      :rating,
      :note,
      :avatar,
      :category_id,
      category_attributes: [:name],
    )
  end

  # def set_chocolate
  #   @chocolate = Chocolate.find_by_id(params[:id])
  # end
end
