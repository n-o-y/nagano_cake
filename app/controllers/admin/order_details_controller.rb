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
    if order_detail.baking?
      order_detail.order.processing_order!
    end
    order_details = OrderDetail.where(order_id: order_detail.order.id)
    if order_details.all?{|order_detail| order_detail.order_completed?}
      order_detail.order.preparing_to_ship!
    end
    redirect_to "/admin/orders/#{order_detail.order.id}"
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end

end
