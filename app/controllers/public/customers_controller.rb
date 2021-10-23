class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(1)
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
