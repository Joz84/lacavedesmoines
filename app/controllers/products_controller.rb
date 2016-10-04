class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :lists_table, only: [:index, :show]

  def index
#    if (  research_params["min_price"] && research_params["max_price"] && research_params["min_price"] > research_params["max_price"] )
    words = (research_params.select { |k, v| !["min_price", "max_price"].include?(k)}.map { |k, v| v }).join(" ")
    @products = !(words.strip).empty? ? Product.pgsearch(words) : Product.all
    if research_params["min_price"] && !(research_params["min_price"]).empty?
      @products = @products.select { |p| (p.price_cents * 1.0 / 100) >= research_params["min_price"].to_f }
    end
    if research_params["max_price"] && !(research_params["max_price"]).empty?
      @products = @products.select { |p| (p.price_cents * 1.0 / 100) <= research_params["max_price"].to_f }
    end
  end

  def show
    @product = Product.find(params[:id])
    @selection = Selection.new
    @suggestions = @product.matching(9)
  end

  def random
    @product = Product.all.sample
    redirect_to product_path( @product.id,
                              @product.sku,
                              @product.alcohol.name,
                              @product.brewery.name,
                              @product.color.name,
                              @product.capacity )
  end

  private

  def research_params
    params.require(:research).permit(:words, [:color, :kind, :brewery], :min_price, :max_price)
  end

  def lists_table
    @list_prices = Product.all.map {|p| p.price_cents * 1.0 / 100}.uniq.sort
    @list_colors = Color.all.map { |c| c.name }.sort
    @list_kinds = Kind.all.map { |k| k.name }.sort
    @list_breweries = Brewery.all.map { |b| b.name }.sort
  end

end
