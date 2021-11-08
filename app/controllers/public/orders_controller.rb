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
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.shipping_cost = Order::SHIPPING_COST
    order.save

    # ordered_items = CartItem.joins(:item).where(customer_id: current_customer.id)
    ordered_items = current_customer.cart_items
    ordered_items.each do |ordered_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.item_id = ordered_item.item_id
      order_detail.price = ordered_item.item.price
      order_detail.amount = ordered_item.amount
      order_detail.save
    end
    CartItem.where(customer_id: current_customer.id).destroy_all
    redirect_to "/orders/complete"
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount)
  end

end