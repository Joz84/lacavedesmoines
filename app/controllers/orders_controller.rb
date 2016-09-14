class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.deposit = Deposit.find_by(name: "Magasin Bordeaux")
    @order.advancement = "non payée"
    if @order.save
      session[:cart].each do |selected|
        s = Selection.new(selected)
        s.order = @order
        s.save
        session[:cart] = nil
      end
      redirect_to root_path
    else
      render :new
    end


  end

  private

  def order_params
    params.require(:order).permit(:delivery,
                                  :address,
                                  :complement,
                                  :postal_code,
                                  :city,
                                  :country,
                                  :telephone)
  end
end
