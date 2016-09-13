class ProductsController < ApplicationController
  def index
    @products = Product.pgsearch(research_params["words"])
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def research_params
    params.require(:research).permit(:words)
  end

end
