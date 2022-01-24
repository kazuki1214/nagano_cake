class HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.all.order(id: :desc)
  end

  def about
  end

end
