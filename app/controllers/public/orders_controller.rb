class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "2"
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
    elsif params[:order][:address_option] == "3"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @cart_items = CartItem.joins(:item)

  end

  def complete
  end

  def create
    order = Order.new
    order.customer_id = current_customer.id
    order.postal_code = params[:postal]
    order.address = params[:address]
    order.name = params[:name]
    order.shipping_cost = Order::SHIPPING_COST
    order.total_payment = params[:total_payment]
    order.payment_method = params[:payment_method]
    order.save


    order_detail = OrderDetail.new
    ordered_items = CartItem.joins(:item).where(customer_id: current_customer.id)
    ordered_items.each do |ordered_item|
      order_detail.order_id = order.id
      order_detail.item_id = ordered_item.item_id
      order_detail.price = ordered_item.item.price
      order_detail.amount = orderd_item.amount
      order_detail.save
    end
    CartItem.where(customer_id: current_customer.id).destroy_all

    redirect_to "/orders/complete"
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method)
  end
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount)
  end

end