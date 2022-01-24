class Admin::HomesController < Admin::ApplicationsController
  def top
    @orders = Order.page(params[:page]).reverse_order
  end
end
