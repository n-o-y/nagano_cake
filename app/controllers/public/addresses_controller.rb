class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to "/addresses"
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to "/addresses"
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
