class Public::CustomersController < ApplicationController
  def unsubscribe
  end

  def withdraw
    customer = current_customer
    customer.update(is_active: false)
    redirect_to "/"
  end
end
