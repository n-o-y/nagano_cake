class Admin::OrderDetailsController < ApplicationController
  def new
    @order_detail = OrderDetail.new
  end

  def create
    @order_detail = OrderDetail.new(order_detail_params)
    @order_detail.save
    redirect_to "/admin/orders/"
  end

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    redirect_to "/admin/orders/#{order_detail.order.id}"
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end

end
