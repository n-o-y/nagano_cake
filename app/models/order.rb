class Order < ApplicationRecord
  enum payment_method: [:credit, :bank]
  enum status: [:awaiting_payment, :payment_received, :processing_order, :preparing_to_ship, :item_shipped]
  validates :customer_id, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  belongs_to :customer
  has_many :order_details
end
