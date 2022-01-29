class ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_order
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genre = Genre.all
  end
end
