class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.pgsearch(research_params["words"])
  end

  def show
    @product = Product.find(params[:id])
    @selection = Selection.new
  end

  private

  def research_params
    params.require(:research).permit(:words)
  end

end
