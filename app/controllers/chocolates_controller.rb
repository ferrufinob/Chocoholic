class ChocolatesController < ApplicationController
  def index
    @chocolates = Chocolate.all
    @categories = Category.all
  end

  def new
    @chocolate = Chocolate.new
  end
end
