class HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.reverse_order.limit(4)
  end

  def about
  end

end
