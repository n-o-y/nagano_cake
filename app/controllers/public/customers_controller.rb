class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(1)
  end

  def edit
    @customer = current_customer
    redirect_to "/customers/my_page"
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
