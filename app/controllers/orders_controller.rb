class OrdersController < ApplicationController
   before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.customer_id = current_customer
    if params[:order][:select_address] == "0"
      @order.name = current_customer.full_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code

    elsif params[:order][:select_address] == "1"
      @address = Addresse.find(params[:order][:address_id])
      @order.name = @address.name
      @order.address = @address.address
      @order.postal_code = @address.postal_code

    elsif params[:order][:select_address] == "2"
    end
  end

  def create
    order = Order.new(order_params)
    order = current_customer
    order.shipping_cost = 800
    current_customer.cart_items.each do |t|
      order_detail = OrderDetail.new
      order_detail.order = order
      order_detail.item = t.item
      order_detail.price = t.item.with_tax_price
      order_detail.amount = t.amount
      total += t.subtotal
      order_detail.save
    end
    order.total_payment = total
    order.save
    redirect_to thanks_order_path
  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method)
  end

end
