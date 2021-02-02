class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
  end
end
