class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.deposit = Deposit.find_by(name: "Magasin Bordeaux")
    if @order.save
      session[:cart].each do |selected|
        s = Selection.new(selected)
        s.order = @order
        s.save
      end
      @order.state = "non payée"
      @order.amount = @order.init_amount
      @order.save
      session[:cart] = nil
      redirect_to new_order_payment_path(@order)
    else
      render :new
    end
  end

  def show
    @order = Order.where(state: 'payée', user: current_user).find(params[:id])
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
