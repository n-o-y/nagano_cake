class CartItem < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :item, optional: true
  def sum_of_price(price, amount)
    price * amount
  end
  def price_with_tax(price)
    price * 1.1
  end
end
