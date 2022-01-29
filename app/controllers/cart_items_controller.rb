class CartItemsController < ApplicationController
   before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_item
  end

  def create
    add_item = current_customer.cart_items.new(cart_item_params)
    cart_item = current_customer.find_by(cart_item_id: params[:item_id])
    if cart_item.item_id == cart_item
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
    cart_item = CarItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.find(params[:id]).destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
