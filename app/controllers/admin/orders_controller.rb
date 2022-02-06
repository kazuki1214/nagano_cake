class Admin::OrdersController < Admin::ApplicationsController
  def show
    @order = Order.find(params[:id])
  end

  def update
    if params[:order][:order_status]
      order = Order.find(params[:id])
      order.update(order_params)
      redirect_to admin_order_path(order)
    end

    if params[:order_detail][:making_status]
      order_detail = OrderDetail.find(params[:id])
      order_detail.update(order_detail_params)
      redirect_to admin_order_path(order_detail.order_id)
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
