class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.joins(:item)
    @cart_item = CartItem.new
    @TAX = 1.1
  end

  def update
    cart_item = CartItem.find(params[:id])
    p cart_item
    cart_item.update(cart_item_params)
    p cart_item
    redirect_to "/cart_items"
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to "/cart_items"
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to "/cart_items"
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to "/cart_items"
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
