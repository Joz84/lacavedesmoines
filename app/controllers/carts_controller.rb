class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :init_cart

  def update
    quantities_are_valids = true
    array_cart = []
    session[:cart].each_with_index do |s, i|
      if selected_params["delete_#{i}"] == "0"
        product = Product.find(selected_params["product_id_#{i}"])
        quantity = selected_params["quantity_#{i}"].to_i
        array_cart << { quantity: quantity, product: product }
        if quantity < 1
          quantities_are_valids = false
          session[:errors] << i
        end
      end
    end
    session[:cart] = array_cart
    if quantities_are_valids and params[:commit] == "Commander"
      redirect_to new_order_path
    else
      render :edit
    end
  end

  def create
    @product = Product.find(added_params["product_id"])
    session[:cart] << { quantity: 1, product: @product }
    redirect_to product_path( @product.id,
                              @product.sku,
                              @product.alcohol.name,
                              @product.brewery.name,
                              @product.color.name,
                              @product.capacity )
  end

  def edit
  end

  private

  def added_params
    params.require(:added).permit(:product_id)
  end

  def selected_params
    array = [:commit]
    session[:cart].each_with_index do |p, i|
      array << "quantity_#{i}".to_sym
      array << "delete_#{i}".to_sym
      array << "product_id_#{i}".to_sym
    end
    params.require(:selected).permit(array)
  end

  def init_cart
    session[:cart] = [] unless session[:cart]
    session[:errors] = []
  end
end
