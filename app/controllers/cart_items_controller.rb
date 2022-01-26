class CartItemsController < ApplicationController
   before_action :authenticate_customer!

  def index
  end

  def create
    @item = Item.new(cart_item_params)
    @item.customer = current_customer
    @item.save
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
