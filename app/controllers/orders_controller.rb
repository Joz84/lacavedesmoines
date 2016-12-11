class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.deposit = Deposit.find_by(sku: "bordeaux")
    if @order.save
      session[:cart].each do |selected|
        s = Selection.new(selected)
        s.order = @order
        s.save
      end
      @order.state = "non payée"
      @order.amount = @order.init_amount + @order.postal_costs
      @order.save
      session[:cart] = []
      session[:errors] = []
      redirect_to new_order_payment_path(@order)
    else
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to dashboard_path
  end

  private

  def order_params
    params.require(:order).permit(:address,
                                  :complement,
                                  :postal_code,
                                  :city,
                                  :country,
                                  :telephone)
  end
end
