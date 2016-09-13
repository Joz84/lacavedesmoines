class CartsController < ApplicationController
  before_action :init_cart

  def create
    @product = Product.find(selected_params["product_id"])
    session[:cart] << { quantity: selected_params["quantity"].to_i, product: @product }
    redirect_to product_path( @product.id,
                              @product.sku,
                              @product.alcohol,
                              @product.brewery,
                              @product.color,
                              @product.specificity,
                              @product.capacity )
  end

  def show
  end

  private

  def selected_params
    params.require(:selected).permit(:quantity, :product_id)
  end

  def init_cart
    session[:cart] = [] unless session[:cart]
  end
end
