class BreweriesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
    @products = Product.where(brewery: @brewery)
  end
end
