class Admin::HomesController < ApplicationController
  def top
    @orders = Order.joins(:customer)
  end
end
