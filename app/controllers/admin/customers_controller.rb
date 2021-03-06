class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to "/admin/customers/#{customer.id}"
  end

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.new(customer_params)
    customer.save
    redirect_to "/admin/customers"
  end

  def withdraw
    customer = Customer.find(current_customer.id)
    customer.is_active = false
    customer.update
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active
      )
  end
end
