class ChocolatesController < ApplicationController
  def index
    @chocolates = Chocolate.all
  end
end
