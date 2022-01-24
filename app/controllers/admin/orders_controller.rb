class Admin::OrdersController < Admin::ApplicationsController
  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:order_status)
  end

end
