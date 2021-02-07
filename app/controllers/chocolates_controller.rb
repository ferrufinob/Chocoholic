class ChocolatesController < ApplicationController
  before_action :require_login
  before_action :set_chocolate, only: [:show, :edit, :update, :destroy]
  before_action :authorized_to_edit, only: [:edit, :update, :destroy]

  def index
    #checking if nested and if we can find that chocolate
    if params[:category_id] && @category = Category.find_by_id(params[:category_id])
      #show all the chocolates that are a part of the category
      @chocolates = @category.chocolates
    elsif params[:search]
      @chocolates = Chocolate.where("flavor LIKE ? OR brand LIKE ? OR note LIKE?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      #less query loads, avoid N+1
      @chocolates = Chocolate.all.with_attached_image
    end
  end

  def show
  end

  def new
    @chocolate = Chocolate.new
    @chocolate.build_category
  end

  def create
    @chocolate = current_user.chocolates.build(chocolate_params)
    #fixes the question mark issue
    if @chocolate.save
      @chocolate.image.attach(params[:chocolate][:image])
      redirect_to chocolate_path(@chocolate)
    else
      render :new
    end
  end

  def edit
  end

  def update
    #delete old image if they update, must be done before the save
    @chocolate.image.purge_later
    @chocolate.image.attach(params[:chocolate][:image])
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
    @chocolates = Chocolate.highest_rating.limit(5)
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
      redirect_to chocolates_path, alert: "Chocolate not found."
    end
  end

  def authorized_to_edit
    if current_user != @chocolate.user
      redirect_to chocolates_path, alert: "Action not authorized."
    end
  end
end
