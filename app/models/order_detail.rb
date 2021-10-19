class OrderDetail < ApplicationRecord
  enum making_status: [:a, :b, :c, :d ]
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :price, presence: true
  validates :amount, presence: true
  belongs_to :order
  belongs_to :item
end
