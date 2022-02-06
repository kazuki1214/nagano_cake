class OrdersController < ApplicationController
   before_action :authenticate_customer!

  def new
    if current_customer.cart_items.exists?
      @order = Order.new
    else
      redirect_to cart_items_path
    end
  end

  def confirm
    @cart_item_total = 0
    @order_shipping_cost = 800
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.customer_id = current_customer.id
    if params[:order][:select_address] == "0"
      @order.name = current_customer.full_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code

    elsif params[:order][:select_address] == "1"
      @address = current_customer.addresses.find_by(id: params[:order][:address_id])
      @order.name = @address.name
      @order.address = @address.address
      @order.postal_code = @address.postal_code

    elsif params[:order][:select_address] == "2"
      if @order.valid?
        render new_order_path
      end
    end
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.shipping_cost = 800
    order.total_payment = 0
    current_customer.cart_items.each do |cart_item|
      order_detail = order.order_details.new
      order_detail.item_id = cart_item.item.id
      order_detail.price = cart_item.item.with_tax_price
      order_detail.amount = cart_item.amount
      order.total_payment += cart_item.subtotal
      order_detail.save
    end
    order.total_payment += order.shipping_cost
    order.save
    current_customer.cart_items.destroy_all
    redirect_to thanks_orders_path
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method)
  end

end
