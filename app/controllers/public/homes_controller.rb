class Public::HomesController < ApplicationController
  def top
    @new_items = Item.order(id: :desc)
  end

  def about
  end
end
