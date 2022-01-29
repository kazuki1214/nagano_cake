class HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.all.reverse_order.limit(4)
  end

  def about
  end

end
