class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.joins(:customer)
  end

  def show
    @order = Order.joins(:customer).find(params[:id])
    @order_detail = OrderDetail.joins(:item).where(order_id: params[:id])
    @TAX = 1.1
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to "/admin/orders/#{order.id}"
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to "/admin/orders"
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
