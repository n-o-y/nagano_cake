class OrderDetail < ApplicationRecord
  enum making_status: { order_pending: 0, preparing_ingredients: 1, baking: 2, order_completed: 3 }
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :price, presence: true
  validates :amount, presence: true
  belongs_to :order
  belongs_to :item
  def sum_of_price(price, amount)
    price * amount
  end
  def price_with_tax(price)
    price * 1.1
  end
end
