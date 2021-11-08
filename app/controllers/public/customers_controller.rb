class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def unsubscribe
  end

  def withdraw
    customer = current_customer
    customer.update(is_active: false)
    reset_session
    redirect_to "/"
  end
end
