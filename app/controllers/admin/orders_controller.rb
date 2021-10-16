class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.joins(:customer)
  end

  def show
    @order - Order.joins(:customer).find(params[:id])
  end

  def update
  end
end
