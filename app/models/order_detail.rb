class OrderDetail < ApplicationRecord
  enum making_status: [:order_pending, :preparing_ingredients, :baking, :order_completed ]
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :price, presence: true
  validates :amount, presence: true
  belongs_to :order
  belongs_to :item
end
