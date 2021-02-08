class ChocolatesController < ApplicationController
  before_action :require_login
  before_action :set_chocolate, only: [:show, :edit, :update, :destroy]
  before_action :authorized_to_edit, only: [:edit, :update, :destroy]
  before_action :find_category, only: [:new, :create]

  def index
    if params[:category_id] && @category = Category.find_by_id(params[:category_id])
      @chocolates = @category.chocolates.with_attached_image
    elsif params[:search]
      @chocolates = Chocolate.search(params[:search]).with_attached_image
    else
      @chocolates = Chocolate.all.with_attached_image
    end
  end

  def show
  end

  def new
    if params[:category_id] && @category
      @chocolate = @category.chocolates.build
    else
      @chocolate = Chocolate.new
      @chocolate.build_category
    end
  end

  def create
    if @category
      @chocolate = @category.chocolates.build(chocolate_params)
      @chocolate.user = current_user
    else
      @chocolate = current_user.chocolates.build(chocolate_params)
    end
    if @chocolate.save
      redirect_to chocolate_path(@chocolate), alert: "successfully created chocolate."
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
    @chocolate.destroy
    redirect_to chocolates_url, alert: "successfully deleted chocolate"
  end

  def most_popular
    @chocolates = Chocolate.highest_rating.limit(5).with_attached_image
  end

  private

  def chocolate_params
    params.require(:chocolate).permit(
      :brand,
      :flavor,
      :note,
      :image,
      :dairy_free,
      :nut_free,
      :category_id,
      category_attributes: [:name],
    )
  end

  def set_chocolate
    unless @chocolate = Chocolate.find_by_id(params[:id])
      flash[:message] = "Chocolate not found"
      redirect_to chocolates_path
    end
  end

  def authorized_to_edit
    if current_user != @chocolate.user
      flash[:message] = "Action not authorized."
      redirect_to chocolates_path
    end
  end

  def find_category
    @category = Category.find_by_id(params[:category_id])
  end
end
