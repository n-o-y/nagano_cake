class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).joins(:customer)
  end
end
