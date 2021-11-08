class Admin::HomesController < Admin::ApplicationController
  def top
    @orders = Order.page(params[:page]).joins(:customer)
  end
end
