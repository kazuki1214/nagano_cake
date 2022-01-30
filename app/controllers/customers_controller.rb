class CustomersController < ApplicationController
   before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    if customer.update(customer_params)
      redirect_to my_page_path
    else
      render edit_customers_path(customer)
    end
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
    customer = Customer.find(params[:id])
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,
    :is_deleted)
  end

end
