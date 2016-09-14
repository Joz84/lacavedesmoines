class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :init_cart

  def create
    @product = Product.find(selected_params["product_id"])
    @quantity = selected_params["quantity"].to_i
    @selection = Selection.new(quantity: @quantity, product: @product)
    @selection.valid?
    #raise
    unless @selection.errors.messages[:quantity][0]
      session[:cart] << { quantity: @quantity, product: @product }
      redirect_to product_path( @product.id,
                                @product.sku,
                                @product.alcohol.name,
                                @product.brewery.name,
                                @product.color.name,
                                @product.specificity.name,
                                @product.capacity )
    else
      render 'products/show'
    end
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
