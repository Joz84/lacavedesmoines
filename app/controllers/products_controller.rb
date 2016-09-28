class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
#    if (  research_params["min_price"] && research_params["max_price"] && research_params["min_price"] > research_params["max_price"] )
    words = (research_params.select { |k, v| !["min_price", "max_price"].include?(k)}.map { |k, v| v }).join(" ")
    @products = !(words.strip).empty? ? Product.pgsearch(words) : Product.all
    @products = @products.select { |p| (p.price_cents * 1.0 / 100) >= research_params["min_price"].to_f } if research_params["min_price"]
    @products = @products.select { |p| (p.price_cents * 1.0 / 100) <= research_params["max_price"].to_f } if research_params["max_price"]
    # Tentative pitoyable de random by Yann
    # @randomproduct = Product.all.shuffle.sample
    # Fin de tentative pitoyable
  end

  def show
    @prices = Product.all.map {|p| p.price_cents * 1.0 / 100}.uniq.sort
    @colors = Color.all.map { |c| c.name }
    @kinds = Kind.all.map { |k| k.name }
    @product = Product.find(params[:id])
    @selection = Selection.new
    @breweries = Brewery.all.map { |b| b.name }
    @suggestions = @product.matching(3)
  end

  private

  def research_params
    params.require(:research).permit(:words, [:color, :kind, :brewery], :min_price, :max_price)
  end

end
