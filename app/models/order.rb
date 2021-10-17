class Order < ApplicationRecord
  enum payment_method: [:credit, :bank]
  enum status: [:making, :shipping]
  belongs_to :customer
  has_many :order_details
end
