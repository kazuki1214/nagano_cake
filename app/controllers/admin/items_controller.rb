class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_oreder
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_ite_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:name,:genre,:image,:introduction, :price, :is_active)
  end
  
end
