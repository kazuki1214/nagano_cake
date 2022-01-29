class AddressesController < ApplicationController
   before_action :authenticate_customer!

  def index
    @address = Addresse.new
    @addresses = Addresse.customer.all
  end

  def create
    address = Addresse.new(address_params)
    address.customer.id = current_customer.id
    address.save
    redirect_to addresses_path
  end

  def edit
    @address = Addresse.find(params[:id])
  end

  def update
    address = Addresse.find(params[:id])
    address.customer.id = current_customer.id
    address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Addresse.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:addresse).permit(:name, :postal_code, :address)
  end
end
