class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.joins(:item)
    @cart_item = CartItem.new
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.item_id = params[:item_id]
    cart_item.customer_id = current_customer.id
    p cart_item
    cart_item.save
    p cart_item
    redirect_to "/cart_items"
  end

  private
  def cart_item_params
    params.permit(:item_id, :customer_id, :amount)
  end
end
