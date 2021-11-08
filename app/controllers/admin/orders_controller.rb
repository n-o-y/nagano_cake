class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).joins(:customer)
  end

  def show
    @order = Order.joins(:customer).find(params[:id])
    @order_detail = OrderDetail.joins(:item).where(order_id: params[:id])
    @TAX = 1.1
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    order_details = order.order_details
    if order.payment_received?
      order_details.each do |order_detail|
        order_detail.preparing_ingredients!
      end
      # order_details.map{|order_detail| order_detail.preparing_ingredients!}
    end
    redirect_to "/admin/orders/#{order.id}"
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
