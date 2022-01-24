class AddressesController < ApplicationController
   before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = Address.customer.all
  end

  def create
    address = Address.new(address_params)
    address.customer.id = current_customer.id
    address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(:id)
  end

  def update
    address = Address.find(:id)
    address.customer.id = current_customer.id
    address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(:id)
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
