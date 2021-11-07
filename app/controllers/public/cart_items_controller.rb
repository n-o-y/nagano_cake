class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.joins(:item)
    @cart_item = CartItem.new
    @TAX = 1.1
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
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
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount = cart_item.amount + params[:cart_item][:amount].to_i
      cart_item.save
    else
      @cart_item.save
    end
    redirect_to "/cart_items"
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
