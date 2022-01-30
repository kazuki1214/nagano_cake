class CartItemsController < ApplicationController
   before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    add_item = CartItem.new(cart_item_params)
    add_item.customer = current_customer
    cart_item = current_customer.find_by(cart_item_id: params[:item_id])
    if cart_item.item_id == add_item
      cart_item.amount += add_item.amount.to_i
      cart_item.save
    else
      add_item.save
    end
    redirect_to cart_items_path
  end

  def update
    cart_item = current_customer.cart_items
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_item.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
