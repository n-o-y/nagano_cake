class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { awaiting_payment: 0, payment_received: 1, processing_order: 2, preparing_to_ship: 3, item_shipped: 4 }
  validates :customer_id, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  belongs_to :customer
  has_many :order_details
  SHIPPING_COST = 800
end
